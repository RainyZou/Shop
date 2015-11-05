var wpNavMenu;
! function (a) {
    var b;
    b = wpNavMenu = {
        options: {
            menuItemDepthPerLevel: 30,
            globalMaxDepth: 11,
            sortableItems: "> *",
            targetTolerance: 0
        },
        menuList: void 0,
        targetList: void 0,
        menusChanged: !1,
        isRTL: !("undefined" == typeof isRtl || !isRtl),
        negateIfRTL: "undefined" != typeof isRtl && isRtl ? -1 : 1,
        init: function () {
            b.menuList = a("#menu-to-edit"), b.targetList = b.menuList, this.jQueryExtensions(), this.attachMenuEditListeners(), this.setupInputWithDefaultTitle(), this.attachQuickSearchListeners(), this.attachThemeLocationsListeners(), this.attachTabsPanelListeners(), this.attachUnsavedChangesListener(), b.menuList.length && this.initSortables(), menus.oneThemeLocationNoMenus && a("#posttype-page").addSelectedToMenu(b.addMenuItemToBottom), this.initManageLocations(), this.initAccessibility(), this.initToggles(), this.initPreviewing()
        }, jQueryExtensions: function () {
            a.fn.extend({
                menuItemDepth: function () {
                    var a = b.isRTL ? this.eq(0).css("margin-right") : this.eq(0).css("margin-left");
                    return b.pxToDepth(a && -1 != a.indexOf("px") ? a.slice(0, -2) : 0)
                }, updateDepthClass: function (b, c) {
                    return this.each(function () {
                        var d = a(this);
                        c = c || d.menuItemDepth(), a(this).removeClass("menu-item-depth-" + c).addClass("menu-item-depth-" + b)
                    })
                }, shiftDepthClass: function (b) {
                    return this.each(function () {
                        var c = a(this),
                            d = c.menuItemDepth();
                        a(this).removeClass("menu-item-depth-" + d).addClass("menu-item-depth-" + (d + b))
                    })
                }, childMenuItems: function () {
                    var b = a();
                    return this.each(function () {
                        for (var c = a(this), d = c.menuItemDepth(), e = c.next(".menu-item"); e.length && e.menuItemDepth() > d;) b = b.add(e), e = e.next(".menu-item")
                    }), b
                }, shiftHorizontally: function (b) {
                    return this.each(function () {
                        var c = a(this),
                            d = c.menuItemDepth(),
                            e = d + b;
                        c.moveHorizontally(e, d)
                    })
                }, moveHorizontally: function (b, c) {
                    return this.each(function () {
                        var d = a(this),
                            e = d.childMenuItems(),
                            f = b - c,
                            g = d.find(".is-submenu");
                        d.updateDepthClass(b, c).updateParentMenuItemDBId(), e && e.each(function () {
                            var b = a(this),
                                c = b.menuItemDepth(),
                                d = c + f;
                            b.updateDepthClass(d, c).updateParentMenuItemDBId()
                        }), 0 === b ? g.hide() : g.show()
                    })
                }, updateParentMenuItemDBId: function () {
                    return this.each(function () {
                        var b = a(this),
                            c = b.find(".menu-item-data-parent-id"),
                            d = parseInt(b.menuItemDepth(), 10),
                            e = d - 1,
                            f = b.prevAll(".menu-item-depth-" + e).first();
                        0 === d ? c.val(0) : c.val(f.find(".menu-item-data-db-id").val())
                    })
                }, hideAdvancedMenuItemFields: function () {
                    return this.each(function () {
                        var b = a(this);
                        a(".hide-column-tog").not(":checked").each(
                        		function () {
                            b.find(".field-" + a(this).val()).addClass("hidden-field")
                        })
                    })
                }, addSelectedToMenu: function (c) {
                    return 0 === a("#menu-to-edit").length ? !1 : this.each(function () {
                        var d = a(this),
                            e = {},
                            f = menus.oneThemeLocationNoMenus && 0 === d.find(".tabs-panel-active .categorychecklist li input:checked").length ? d.find('#page-all li input[type="checkbox"]') : d.find(".tabs-panel-active .categorychecklist li input:checked"),
                            g = /menu-item\[([^\]]*)/;
                        return c = c || b.addMenuItemToBottom, f.length ? (d.find(".spinner").addClass("is-active"), a(f).each(function () {
                            var d = a(this),
                                f = g.exec(d.attr("name")),
                                h = "undefined" == typeof f[1] ? 0 : parseInt(f[1], 10);
                            this.className && -1 != this.className.indexOf("add-to-top") && (c = b.addMenuItemToTop), e[h] = d.closest("li").getItemData("add-menu-item", h)
                        }), void b.addItemToMenu(e, c, function () {
                            f.removeAttr("checked"), d.find(".spinner").removeClass("is-active")
                        })) : !1
                    })
                }, getItemData: function (a, b) {
                    a = a || "menu-item";
                    var c, d = {},
                        e = ["menu-item-db-id", "menu-item-object-id", "menu-item-object", "menu-item-parent-id", "menu-item-position", "menu-item-type", "menu-item-title", "menu-item-url", "menu-item-description", "menu-item-attr-title", "menu-item-target", "menu-item-classes", "menu-item-xfn"];
                    return b || "menu-item" != a || (b = this.find(".menu-item-data-db-id").val()), b ? (this.find("input").each(function () {
                        var f;
                        for (c = e.length; c--;) "menu-item" == a ? f = e[c] + "[" + b + "]" : "add-menu-item" == a && (f = "menu-item[" + b + "][" + e[c] + "]"), this.name && f == this.name && (d[e[c]] = this.value)
                    }), d) : d
                }, setItemData: function (b, c, d) {
                    return c = c || "menu-item", d || "menu-item" != c || (d = a(".menu-item-data-db-id", this).val()), d ? (this.find("input").each(function () {
                        var e, f = a(this);
                        a.each(b, function (a, b) {
                            "menu-item" == c ? e = a + "[" + d + "]" : "add-menu-item" == c && (e = "menu-item[" + d + "][" + a + "]"), e == f.attr("name") && f.val(b)
                        })
                    }), this) : this
                }
            })
        }, countMenuItems: function (b) {
            return a(".menu-item-depth-" + b).length
        }, moveMenuItem: function (c, d) {
            var e, f, g, h = a("#menu-to-edit li"),
                i = h.length,
                j = c.parents("li.menu-item"),
                k = j.childMenuItems(),
                l = j.getItemData(),
                m = parseInt(j.menuItemDepth(), 10),
                n = parseInt(j.index(), 10),
                o = j.next(),
                p = o.childMenuItems(),
                q = parseInt(o.menuItemDepth(), 10) + 1,
                r = j.prev(),
                s = parseInt(r.menuItemDepth(), 10),
                t = r.getItemData()["menu-item-db-id"];
            switch (d) {
            case "up":
                if (f = n - 1, 0 === n) break;
                0 === f && 0 !== m && j.moveHorizontally(0, m), 0 !== s && j.moveHorizontally(s, m), k ? (e = j.add(k), e.detach().insertBefore(h.eq(f)).updateParentMenuItemDBId()) : j.detach().insertBefore(h.eq(f)).updateParentMenuItemDBId();
                break;
            case "down":
                if (k) {
                    if (e = j.add(k), o = h.eq(e.length + n), p = 0 !== o.childMenuItems().length, p && (g = parseInt(o.menuItemDepth(), 10) + 1, j.moveHorizontally(g, m)), i === n + e.length) break;
                    e.detach().insertAfter(h.eq(n + e.length)).updateParentMenuItemDBId()
                } else {
                    if (0 !== p.length && j.moveHorizontally(q, m), i === n + 1) break;
                    j.detach().insertAfter(h.eq(n + 1)).updateParentMenuItemDBId()
                }
                break;
            case "top":
                if (0 === n) break;
                k ? (e = j.add(k), e.detach().insertBefore(h.eq(0)).updateParentMenuItemDBId()) : j.detach().insertBefore(h.eq(0)).updateParentMenuItemDBId();
                break;
            case "left":
                if (0 === m) break;
                j.shiftHorizontally(-1);
                break;
            case "right":
                if (0 === n) break;
                if (l["menu-item-parent-id"] === t) break;
                j.shiftHorizontally(1)
            }
            c.focus(), b.registerChange(), b.refreshKeyboardAccessibility(), b.refreshAdvancedAccessibility()
        }, initAccessibility: function () {
            var c = a("#menu-to-edit");
            b.refreshKeyboardAccessibility(), b.refreshAdvancedAccessibility(), c.on("mouseenter.refreshAccessibility focus.refreshAccessibility touchstart.refreshAccessibility", ".menu-item", function () {
                b.refreshAdvancedAccessibilityOfItem(a(this).find("a.item-edit"))
            }), c.on("click", "a.item-edit", function () {
                b.refreshAdvancedAccessibilityOfItem(a(this))
            }), c.on("click", ".menus-move", function (c) {
                var d = a(this),
                    e = d.data("dir");
                "undefined" != typeof e && b.moveMenuItem(a(this).parents("li.menu-item").find("a.item-edit"), e), c.preventDefault()
            })
        }, refreshAdvancedAccessibilityOfItem: function (b) {
            if (!0 === a(b).data("needs_accessibility_refresh")) {
                var c, d, e, f, g, h, i, j, k, l = a(b),
                    m = l.closest("li.menu-item").first(),
                    n = m.menuItemDepth(),
                    o = 0 === n,
                    p = l.closest(".menu-item-handle").find(".menu-item-title").text(),
                    q = parseInt(m.index(), 10),
                    r = o ? n : parseInt(n - 1, 10),
                    s = m.prevAll(".menu-item-depth-" + r).first().find(".menu-item-title").text(),
                    t = m.prevAll(".menu-item-depth-" + n).first().find(".menu-item-title").text(),
                    u = a("#menu-to-edit li").length,
                    v = m.nextAll(".menu-item-depth-" + n).length;
                m.find(".field-move").toggle(u > 1), 0 !== q && (c = m.find(".menus-move-up"), c.prop("title", menus.moveUp).css("display", "inline")), 0 !== q && o && (c = m.find(".menus-move-top"), c.prop("title", menus.moveToTop).css("display", "inline")), q + 1 !== u && 0 !== q && (c = m.find(".menus-move-down"), c.prop("title", menus.moveDown).css("display", "inline")), 0 === q && 0 !== v && (c = m.find(".menus-move-down"), c.prop("title", menus.moveDown).css("display", "inline")), o || (c = m.find(".menus-move-left"), d = menus.outFrom.replace("%s", s), c.prop("title", menus.moveOutFrom.replace("%s", s)).text(d).css("display", "inline")), 0 !== q && m.find(".menu-item-data-parent-id").val() !== m.prev().find(".menu-item-data-db-id").val() && (c = m.find(".menus-move-right"), d = menus.under.replace("%s", t), c.prop("title", menus.moveUnder.replace("%s", t)).text(d).css("display", "inline")), o ? (e = a(".menu-item-depth-0"), f = e.index(m) + 1, u = e.length, g = menus.menuFocus.replace("%1$s", p).replace("%2$d", f).replace("%3$d", u)) : (h = m.prevAll(".menu-item-depth-" + parseInt(n - 1, 10)).first(), i = h.find(".menu-item-data-db-id").val(), j = h.find(".menu-item-title").text(), k = a('.menu-item .menu-item-data-parent-id[value="' + i + '"]'), f = a(k.parents(".menu-item").get().reverse()).index(m) + 1, g = menus.subMenuFocus.replace("%1$s", p).replace("%2$d", f).replace("%3$s", j)), l.prop("title", g).text(g), l.data("needs_accessibility_refresh", !1)
            }
        }, refreshAdvancedAccessibility: function () {
            a(".menu-item-settings .field-move a").hide(), a("a.item-edit").data("needs_accessibility_refresh", !0), a(".menu-item-edit-active a.item-edit").each(function () {
                b.refreshAdvancedAccessibilityOfItem(this)
            })
        }, refreshKeyboardAccessibility: function () {
            a("a.item-edit").off("focus").on("focus", function () {
                a(this).off("keydown").on("keydown", function (c) {
                    var d, e = a(this),
                        f = e.parents("li.menu-item"),
                        g = f.getItemData();
                    if ((37 == c.which || 38 == c.which || 39 == c.which || 40 == c.which) && (e.off("keydown"), 1 !== a("#menu-to-edit li").length)) {
                        switch (d = {
                            38: "up",
                            40: "down",
                            37: "left",
                            39: "right"
                        }, a("body").hasClass("rtl") && (d = {
                            38: "up",
                            40: "down",
                            39: "left",
                            37: "right"
                        }), d[c.which]) {
                        case "up":
                            b.moveMenuItem(e, "up");
                            break;
                        case "down":
                            b.moveMenuItem(e, "down");
                            break;
                        case "left":
                            b.moveMenuItem(e, "left");
                            break;
                        case "right":
                            b.moveMenuItem(e, "right")
                        }
                        return a("#edit-" + g["menu-item-db-id"]).focus(), !1
                    }
                })
            })
        }, initPreviewing: function () {
            a("#menu-to-edit").on("change input", ".edit-menu-item-title", function (b) {
                var c, d, e = a(b.currentTarget);
                c = e.val(), d = e.closest(".menu-item").find(".menu-item-title"), c ? d.text(c).removeClass("no-title") : d.text(navMenuL10n.untitled).addClass("no-title")
            })
        }, initToggles: function () {
            postboxes.add_postbox_toggles("nav-menus"), columns.useCheckboxesForHidden(), columns.checked = function (b) {
                a(".field-" + b).removeClass("hidden-field")
            }, columns.unchecked = function (b) {
                a(".field-" + b).addClass("hidden-field")
            }, b.menuList.hideAdvancedMenuItemFields(), a(".hide-postbox-tog").click(function () {
                var b = a(".accordion-container li.accordion-section").filter(":hidden").map(function () {
                    return this.id
                }).get().join(",");
                a.post(ajaxurl, {
                    action: "closed-postboxes",
                    hidden: b,
                    closedpostboxesnonce: jQuery("#closedpostboxesnonce").val(),
                    page: "nav-menus"
                })
            })
        }, initSortables: function () {
            function c(a) {
                var c;
                j = a.placeholder.prev(".menu-item"), k = a.placeholder.next(".menu-item"), j[0] == a.item[0] && (j = j.prev(".menu-item")), k[0] == a.item[0] && (k = k.next(".menu-item")), l = j.length ? j.offset().top + j.height() : 0, m = k.length ? k.offset().top + k.height() / 3 : 0, h = k.length ? k.menuItemDepth() : 0, i = j.length ? (c = j.menuItemDepth() + 1) > b.options.globalMaxDepth ? b.options.globalMaxDepth : c : 0
            }

            function d(a, b) {
                a.placeholder.updateDepthClass(b, q), q = b
            }

            function e() {
                if (!s[0].className) return 0;
                var a = s[0].className.match(/menu-max-depth-(\d+)/);
                return a && a[1] ? parseInt(a[1], 10) : 0
            }

            function f(c) {
                var d, e = t;
                if (0 !== c) {
                    if (c > 0) d = p + c, d > t && (e = d);
                    else if (0 > c && p == t)
                        for (; !a(".menu-item-depth-" + e, b.menuList).length && e > 0;) e--;
                    s.removeClass("menu-max-depth-" + t).addClass("menu-max-depth-" + e), t = e
                }
            }
            var g, h, i, j, k, l, m, n, o, p, q = 0,
                r = b.menuList.offset().left,
                s = a("body"),
                t = e();
            0 !== a("#menu-to-edit li").length && a(".drag-instructions").show(), r += b.isRTL ? b.menuList.width() : 0, b.menuList.sortable({
                handle: ".menu-item-handle",
                placeholder: "sortable-placeholder",
                items: b.options.sortableItems,
                start: function (e, f) {
                    var h, i, j, k, l;
                    b.isRTL && (f.item[0].style.right = "auto"), o = f.item.children(".menu-item-transport"), g = f.item.menuItemDepth(), d(f, g), j = f.item.next()[0] == f.placeholder[0] ? f.item.next() : f.item, k = j.childMenuItems(), o.append(k), h = o.outerHeight(), h += h > 0 ? 1 * f.placeholder.css("margin-top").slice(0, -2) : 0, h += f.helper.outerHeight(), n = h, h -= 2, f.placeholder.height(h), p = g, k.each(function () {
                        var b = a(this).menuItemDepth();
                        p = b > p ? b : p
                    }), i = f.helper.find(".menu-item-handle").outerWidth(), i += b.depthToPx(p - g), i -= 2, f.placeholder.width(i), l = f.placeholder.next(".menu-item"), l.css("margin-top", n + "px"), f.placeholder.detach(), a(this).sortable("refresh"), f.item.after(f.placeholder), l.css("margin-top", 0), c(f)
                }, stop: function (a, c) {
                    var d, e, h = q - g;
                    d = o.children().insertAfter(c.item), e = c.item.find(".item-title .is-submenu"), q > 0 ? e.show() : e.hide(), 0 !== h && (c.item.updateDepthClass(q), d.shiftDepthClass(h), f(h)), b.registerChange(), c.item.updateParentMenuItemDBId(), c.item[0].style.top = 0, b.isRTL && (c.item[0].style.left = "auto", c.item[0].style.right = 0), b.refreshKeyboardAccessibility(), b.refreshAdvancedAccessibility()
                }, change: function (a, d) {
                    d.placeholder.parent().hasClass("menu") || (j.length ? j.after(d.placeholder) : b.menuList.prepend(d.placeholder)), c(d)
                }, sort: function (e, f) {
                    var g = f.helper.offset(),
                        j = b.isRTL ? g.left + f.helper.width() : g.left,
                        o = b.negateIfRTL * b.pxToDepth(j - r);
                    o > i || g.top < l - b.options.targetTolerance ? o = i : h > o && (o = h), o != q && d(f, o), m && g.top + n > m && (k.after(f.placeholder), c(f), a(this).sortable("refreshPositions"))
                }
            })
        }, initManageLocations: function () {
            a("#menu-locations-wrap form").submit(function () {
                window.onbeforeunload = null
            }), a(".menu-location-menus select").on("change", function () {
                var b = a(this).closest("tr").find(".locations-edit-menu-link");
                a(this).find("option:selected").data("orig") ? b.show() : b.hide()
            })
        }, attachMenuEditListeners: function () {
            var b = this;
            a("#update-nav-menu").bind("click", function (a) {
                if (a.target && a.target.className) {
                    if (-1 != a.target.className.indexOf("item-edit")) return b.eventOnClickEditLink(a.target);
                    if (-1 != a.target.className.indexOf("menu-save")) return b.eventOnClickMenuSave(a.target);
                    if (-1 != a.target.className.indexOf("menu-delete")) return b.eventOnClickMenuDelete(a.target);
                    if (-1 != a.target.className.indexOf("item-delete")) return b.eventOnClickMenuItemDelete(a.target);
                    if (-1 != a.target.className.indexOf("item-cancel")) return b.eventOnClickCancelLink(a.target)
                }
            }), a('#add-custom-links input[type="text"]').keypress(function (b) {
                a("#customlinkdiv").removeClass("form-invalid"), 13 === b.keyCode && (b.preventDefault(), a("#submit-customlinkdiv").click())
            })
        }, setupInputWithDefaultTitle: function () {
            var b = "input-with-default-title";
            a("." + b).each(function () {
                var c = a(this),
                    d = c.attr("title"),
                    e = c.val();
                if (c.data(b, d), "" === e) c.val(d);
                else {
                    if (d == e) return;
                    c.removeClass(b)
                }
            }).focus(function () {
                var c = a(this);
                c.val() == c.data(b) && c.val("").removeClass(b)
            }).blur(function () {
                var c = a(this);
                "" === c.val() && c.addClass(b).val(c.data(b))
            }), a(".blank-slate .input-with-default-title").focus()
        }, attachThemeLocationsListeners: function () {
            var b = a("#nav-menu-theme-locations"),
                c = {};
            c.action = "menu-locations-save", c["menu-settings-column-nonce"] = a("#menu-settings-column-nonce").val(), b.find('input[type="submit"]').click(function () {
                return b.find("select").each(function () {
                    c[this.name] = a(this).val()
                }), b.find(".spinner").addClass("is-active"), a.post(ajaxurl, c, function () {
                    b.find(".spinner").removeClass("is-active")
                }), !1
            })
        }, attachQuickSearchListeners: function () {
            var c;
            a(".quick-search").keypress(function (d) {
                var e = a(this);
                return 13 == d.which ? (b.updateQuickSearchResults(e), !1) : (c && clearTimeout(c), void(c = setTimeout(function () {
                    b.updateQuickSearchResults(e)
                }, 400)))
            }).attr("autocomplete", "off")
        }, updateQuickSearchResults: function (c) {
            var d, e, f = 2,
                g = c.val();
            g.length < f || (d = c.parents(".tabs-panel"), e = {
                action: "menu-quick-search",
                "response-format": "markup",
                menu: a("#menu").val(),
                "menu-settings-column-nonce": a("#menu-settings-column-nonce").val(),
                q: g,
                type: c.attr("name")
            }, a(".spinner", d).addClass("is-active"), a.post(ajaxurl, e, function (a) {
                b.processQuickSearchQueryResponse(a, e, d)
            }))
        }, addCustomLink: function (c) {
            var d = a("#custom-menu-item-url").val(),
                e = a("#custom-menu-item-name").val();
            return c = c || b.addMenuItemToBottom, 
            "" === d || "http://" == d ? (a("#customlinkdiv").addClass("form-invalid"), !1) : (a(".customlinkdiv .spinner").addClass("is-active"), 
            		void this.addLinkToMenu(d, e, c, function () {
                a(".customlinkdiv .spinner").removeClass("is-active"), a("#custom-menu-item-name").val("").blur(), a("#custom-menu-item-url").val("http://")
            }))
        }, addLinkToMenu: function (a, c, d, e) {
            d = d || b.addMenuItemToBottom, e = e || function () {}, b.addItemToMenu({
                "-1": {
                    "menu-item-type": "custom",
                    "menu-item-url": a,
                    "menu-item-title": c
                }
            }, d, e)
        }, addItemToMenu: function (h, c, d) {
            var e, f = a("#menu").val(),
                g = a("#menu-settings-column-nonce").val();
            c = c || function () {}, d = d || function () {}, e = {
                action: "add-menu-item",
                menu: f,
                "menu-settings-column-nonce": g,
                "menu-item": h
            }, b.setMenuPost(c,d,e,f,h);
        },setMenuPost:function(c,d, e,f, h){
        	  var f = a("#menu-instructions");
              h = a.trim(h),
              c(e), 
              a("li.pending").hide().fadeIn("slow"), 
              a(".drag-instructions").show(), 
              !f.hasClass("menu-instructions-inactive") && f.siblings().length && f.addClass("menu-instructions-inactive"), 
              d();
        }, addMenuItemToBottom: function (c) {
            a(c).hideAdvancedMenuItemFields().appendTo(b.targetList), 
            b.refreshKeyboardAccessibility(),
            b.refreshAdvancedAccessibility()
        }, addMenuItemToTop: function (c) {
            a(c).hideAdvancedMenuItemFields().prependTo(b.targetList),
            b.refreshKeyboardAccessibility(), 
            b.refreshAdvancedAccessibility()
        }, attachUnsavedChangesListener: function () {
            a("#menu-management input, #menu-management select, #menu-management, #menu-management textarea, .menu-location-menus select").change(function () {
                b.registerChange()
            }), 0 !== a("#menu-to-edit").length || 0 !== a(".menu-location-menus select").length ? window.onbeforeunload = function () {
                return b.menusChanged ? navMenuL10n.saveAlert : void 0
            } : a("#menu-settings-column").find("input,select").end().find("a").attr("href", "#").unbind("click")
        }, registerChange: function () {
            b.menusChanged = !0
        }, attachTabsPanelListeners: function () {
            a("#menu-settings-column").bind("click", function (c) {
                var d, e, f, g, h = a(c.target);
                if (h.hasClass("nav-tab-link")){ e = h.data("type"), f = h.parents(".accordion-section-content").first(), a("input", f).removeAttr("checked"), a(".tabs-panel-active", f).removeClass("tabs-panel-active").addClass("tabs-panel-inactive"), a("#" + e, f).removeClass("tabs-panel-inactive").addClass("tabs-panel-active"), a(".tabs", f).removeClass("tabs"), h.parent().addClass("tabs"), a(".quick-search", f).focus(), c.preventDefault();
                }else if (h.hasClass("select-all")) {
                    if (d = /#(.*)$/.exec(c.target.href), d && d[1]) return g = a("#" + d[1] + " .tabs-panel-active .menu-item-title input"), g.length === g.filter(":checked").length ? g.removeAttr("checked") : g.prop("checked", !0), !1
                } else {
                    if (h.hasClass("submit-add-to-menu")) 
                    	return b.registerChange(), 
                    		c.target.id && "submit-customlinkdiv" == c.target.id ? b.addCustomLink(b.addMenuItemToBottom) : c.target.id && -1 != c.target.id.indexOf("submit-") && a("#" + c.target.id.replace(/submit-/, "")).addSelectedToMenu(b.addMenuItemToBottom), 
                    			!1;
                    if (h.hasClass("page-numbers")) 
                    	return a.post(ajaxurl, c.target.href.replace(/.*\?/, "").replace(/action=([^&]*)/, "") + "&action=menu-get-metabox", function (b) {
                        if (-1 != b.indexOf("replace-id")) {
                            var c = a.parseJSON(b),
                                d = document.getElementById(c["replace-id"]),
                                e = document.createElement("div"),
                                f = document.createElement("div");
                            c.markup && d && (f.innerHTML = c.markup ? c.markup : "", d.parentNode.insertBefore(e, d), e.parentNode.removeChild(d), e.parentNode.insertBefore(f, e), e.parentNode.removeChild(e))
                        }
                    }), !1
                }
            })
        }, eventOnClickEditLink: function (b) {
            var c, d, e = /#(.*)$/.exec(b.href);
            return e && e[1] && (c = a("#" + e[1]), d = c.parent(), 0 !== d.length) ? (d.hasClass("menu-item-edit-inactive") ? (c.data("menu-item-data") || c.data("menu-item-data", c.getItemData()), c.slideDown("fast"), d.removeClass("menu-item-edit-inactive").addClass("menu-item-edit-active")) : (c.slideUp("fast"), d.removeClass("menu-item-edit-active").addClass("menu-item-edit-inactive")), !1) : void 0
        }, eventOnClickCancelLink: function (b) {
            var c = a(b).closest(".menu-item-settings"),
                d = a(b).closest(".menu-item");
            return d.removeClass("menu-item-edit-active").addClass("menu-item-edit-inactive"), c.setItemData(c.data("menu-item-data")).hide(), !1
        }, eventOnClickMenuSave: function () {
            var c = "",
                d = a("#menu-name"),
                e = d.val();
            return e && e != d.attr("title") && e.replace(/\s+/, "") ? (a("#nav-menu-theme-locations select").each(function () {
                c += '<input type="hidden" name="' + this.name + '" value="' + a(this).val() + '" />'
            }), a("#update-nav-menu").append(c), b.menuList.find(".menu-item-data-position").val(function (a) {
                return a + 1
            }), window.onbeforeunload = null, !0) : (d.parent().addClass("form-invalid"), !1)
        }, eventOnClickMenuDelete: function () {
            return window.confirm(navMenuL10n.warnDeleteMenu) ? (window.onbeforeunload = null, !0) : !1
        }, eventOnClickMenuItemDelete: function (c) {
            var d = parseInt(c.id.replace("delete-", ""), 10);
            return b.removeMenuItem(a("#menu-item-" + d)), b.registerChange(), !1
        }, processQuickSearchQueryResponse: function (b, c, d) {
            var e, f, g, h = {},
                i = document.getElementById("nav-menu-meta"),
                j = /menu-item[(\[^]\]*/,
                k = a("<div>").html(b).find("li");
            return k.length ? (k.each(function () {
                if (g = a(this), e = j.exec(g.html()), e && e[1]) {
                    for (f = e[1]; i.elements["menu-item[" + f + "][menu-item-type]"] || h[f];) f--;
                    h[f] = !0, f != e[1] && g.html(g.html().replace(new RegExp("menu-item\\[" + e[1] + "\\]", "g"), "menu-item[" + f + "]"))
                }
            }), a(".categorychecklist", d).html(k), void a(".spinner", d).removeClass("is-active")) : (a(".categorychecklist", d).html("<li><p>" + navMenuL10n.noResultsFound + "</p></li>"), void a(".spinner", d).removeClass("is-active"))
        }, removeMenuItem: function (c) {
            var d = c.childMenuItems();
            c.addClass("deleting").animate({
                opacity: 0,
                height: 0
            }, 350, function () {
                var e = a("#menu-instructions");
                c.remove(), d.shiftDepthClass(-1).updateParentMenuItemDBId(), 0 === a("#menu-to-edit li").length && (a(".drag-instructions").hide(), e.removeClass("menu-instructions-inactive")), b.refreshAdvancedAccessibility()
            })
        }, depthToPx: function (a) {
            return a * b.options.menuItemDepthPerLevel
        }, pxToDepth: function (a) {
            return Math.floor(a / b.options.menuItemDepthPerLevel)
        }
    }, a(document).ready(function () {
        wpNavMenu.init()
    })
}(jQuery);