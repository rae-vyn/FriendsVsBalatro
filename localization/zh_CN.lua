return {
    descriptions = {
        Mod = {
            FriendsVsBalatro = {
                name = "Friends Vs. Balatro",
                text = {
                    "将{C:personality}好友派对{}机制融入Balatro"
                }
            }
        },
        HotCard = {
            c_fvb_green_herb = {
                name = "草本植物",
                text = {"为手中的每张卡牌", "赋予{C:blue}+20{}筹码"}
            },
            c_fvb_dither = {
                name = "幻影加持",
                text = {"为手中的每张卡牌", "增加 {C:blue}+20{} 筹码"}
            },
            c_fvb_banding = {
                name = "带状效应",
                text = {
                    "{C:green}1/2{}概率", 
                    "将手中的每张卡牌",
                    "转化为{C:mult}倍率{}卡"
                },
            },
        },
        Joker = {
            j_fvb_donnie_b = {
                name = "唐尼·B",
                text = {
                    "每次打出{C:attention}皇后牌{}",
                    "获得{C:chips}+#2#{}筹码",
                    "(当前{C:chips}+#1#{})"
                }
            },
            j_fvb_stevie_gull = {
                name = "史蒂夫·格尔",
                text = {
                    "每回合开始时",
                    "装填{C:weapon}黄金博伊拉{}",
                    "并增加{C:mult}+#1#{}伤害"
                }
            },
            j_fvb_spike_remington = {
                name = "斯派克·雷明顿",
                text = {
                    "每次打出{C:attention}A{}",
                    "当前持有的{C:weapon}武器{}",
                    "增加{C:mult}+#1#{}伤害"
                }
            },
            j_fvb_sable_santana = {
                name = "萨布·桑塔纳",
                text = {
                    "每回合开始时",
                    "装填{C:weapon}武士刀{}",
                    "并{C:white,X:mult}X#1#{}伤害"
                }
            },
            j_fvb_duck_anderson = {
                name = "达克·安德森",
                text = {
                    "每回合开始时",
                    "获得一张{C:buff}草本植物{}卡"
                }
            },
            j_fvb_dj_newton = {
                name = "DJ 牛顿",
                text = {
                    "每回合{C:green}未命中率{}",
                    "减少{C:green}#1#%"
                }
            },
            j_fvb_moose_salto = {
                name = "穆斯林·萨尔托",
                text = {
                    "每跳过{C:attention}2{}个盲注",
                    "将{C:white,X:mult}倍率{}",
                    "提升至下一个{C:mult}2的幂次方",
                    "(当前{C:white,X:mult}X2 ^ #1#{})"
                }
            },
            j_fvb_myk_raver = {
                name = "迈克·雷弗",
                text = {
                    "每回合{C:attention}翻倍",
                    "{C:weapon}铜蝗虫{}的",
                    "最大弹药量"
                }
            },
            j_fvb_little_lars = {
                name = "小拉尔斯",
                text = {
                    "将{C:attention}盲注大小{}",
                    "减少{C:mult}#1#%{}，并在击败",
                    "{C:attention}Boss盲注{}后增加{C:mult}#2#%{}"
                }
            },
            j_fvb_haru = {
                name = "哈鲁",
                text = {
                    "每开始一个{C:attention}盲注{}",
                    "获得{C:white,X:mult}X#2#{}倍率",
                    "跳过盲注时重置",
                    "(当前{C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_klustr = {
                name = "小克鲁斯特",
                text = {
                    "每回合开始时",
                    "获得{C:personality,E:1}幻影加持和带状效应{}",
                    "(必需有空位)"
                }
            },
            j_fvb_ribberto = {
                name = "里贝托·马利根",
                text = {
                    "打出{C:attention}同花顺{}时",
                    "创建一张随机的{C:personality,E:1}Friends{}卡牌",
                    "(需有空位)"
                }
            },
            j_fvb_margarita = {
                name = "玛格丽塔·卡拉",
                text = {
                    "打出{C:attention}同花{}时",
                    "触发{C:weapon}效果"
                }
            },
            j_fvb_dale = {
                name = "戴尔·多诺万",
                text = {
                    "重触发{C:attention}最后{}打出的卡",
                    "如果该卡是{C:attention}A{}",
                    "则获得{C:white,X:mult}X0.5{}倍率",
                    "(当前{C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_dingo = {
                name = "FKF_丁戈",
                text = {
                    "{C:mult}摧毁{}每张弃牌",
                    "每张牌获得{C:white,X:mult}X#2#{}",
                    "(当前: {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_siaro = {
                name = "西亚罗",
                text = {
                    "每张打出的卡",
                    "获得{C:green}毒药{}封印"
                }
            },
            j_fvb_jawhara = {
                name = "乔哈拉农场",
                text = {
                    "每{C:mult}未命中{}一次",
                    "获得{C:white,X:mult}X#2#{}倍率",
                    "(当前: {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_laika = {
                name = "莱卡",
                text = {
                    "{C:weapon}莱卡{}总是有两发子弹",
                    "每{C:mult}命中{}一次",
                    "获得{C:white,X:mult}X#2#{}倍率",
                    "(当前: {C:white,X:mult}X#1#{})"
                }
            },
            j_fvb_dooper = {
                name = "杜珀",
                text = {
                    "每次打出{C:red}红心{}",
                    "获得{C:mult}+#2#{}倍率",
                    "在最后一手牌时",
                    "变为{C:white,X:mult}X倍率{}",
                    "(当前: {C:white,X:mult}+/X#1#{})"
                }
            },
            j_fvb_ktqtpi = {
                name = "KTQTPI",
                text = {
                    "每张打出的卡",
                    "获得{C:chips}#1#{}筹码",
                    "X手牌数量"
                }
            },
            j_fvb_bach = {
                name = "巴赫·罗德斯坦",
                text = {
                    "如果手牌达到",
                    "所需筹码的{C:attention}#1#%{}",
                    "自动{C:attention}赢得{}盲注"
                }
            }
        },
        Buff = {
            c_fvb_medkit = {
                name = "医疗包",
                text = { "为手牌中每张牌", "增加{C:blue}+50{}筹码" }
            },
            c_fvb_small_head = {
                name = "小脑袋",
                text = { "将{C:attention}盲注{}大小", "减少{C:mult}50%{}" }
            },
            c_fvb_steel_bullets = {
                name = "钢制子弹",
                text = {
                    "提升{C:weapon}武器{}的",
                    "{C:mult}伤害{} {C:white,X:mult}50%{}"
                }
            },
            c_fvb_big_mag = {
                name = "大弹匣",
                text = {
                    "增加{C:weapon}武器{}的",
                    "{C:inactive}弹药{} {C:green}50%{}"
                }
            },
            c_fvb_akimbo = {
                name = "双持",
                text = {
                    "复制当前持有的",
                    "{C:weapon}武器{}",
                    "{C:inactive}(不可叠加)"
                }
            },
            c_fvb_health_up = {
                name = "生命提升",
                text = { "每张手牌", "{C:blue}+10{}筹码" }
            },
            c_fvb_move_faster = {
                name = "快速移动",
                text = { "将{C:attention}盲注{}大小", "减少10%" }
            },
            c_fvb_double_jump = {
                name = "二段跳",
                text = {
                    "{C:attention}将得分筹码设为盲注大小",
                    "{C:mult}-2{}手牌上限"
                }
            },
            c_fvb_more_accuracy = {
                name = "精准提升",
                text = { 
                    "为持有的{C:weapon}武器{}", 
                    "减少{C:green}10%{}未命中率"
                    }
            },
            c_fvb_quick_reload = {
                name = "快速装填",
                text = {
                    "为持有的{C:weapon}武器{}",
                    "减少{C:attention}1次{}装填时间",
                    "{C:inactive}(最低为1)"
                }
            },
            c_fvb_vampire_bullets = {
                name = "吸血子弹",
                text = {
                    "持有此卡",
                    "每次{C:weapon}射击命中时",
                    "从盲注大小中移除{C:blue}100筹码{}"
                }
            },
            c_fvb_extra_cards = {
                name = "额外卡牌",
                text = { "从牌组中", "抽取{C:attention}3张牌" }
            },
            c_fvb_energy_drink = {
                name = "能量饮料",
                text = { "跳过盲注时", "获得{C:money}$5{}，{C:red}之后自毁" }
            },
            c_fvb_helmet = {
                name = "头盔",
                text = { "将{C:attention}盲注{}大小", "减少{C:blue}100{}" }
            },
            c_fvb_poison_bullets = {
                name = "毒子弹",
                text = {
                    "持有此卡时",
                    "每次 {C:weapon}命中卡牌",
                    "获得 {C:green,T:s_fvb_poison}毒药{} 封印",

                }
            },
            c_fvb_tin_man = {
                name = "铁皮人",
                text = {
                    "持有此卡时",
                    "每次{C:weapon}未命中卡牌",
                    "变为{C:attention}钢铁{}卡",
                }
            },
            c_fvb_card_profaner = {
                name = "卡片亵渎者",
                text = {
                    "从 {C:attention}弃牌堆中",
                    "抽取最后 3 张牌"
                }
            },
            c_fvb_card_thief = {
                name = "卡片窃贼",
                text = {"随机创建一张", "{C:buff}增益{} 卡"}
            }
        },
        Debuff = {
            c_fvb_big_head = {
                name = "大头",
                text = {
                    "{C:attention}盲注大小X1.25{}",
                    "{C:mult}#1#{}回合后获得{C:money}$20{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_health_down = {
                name = "生命降低",
                text = {
                    "每次打出1张牌{C:chips}-1{}筹码",
                    "{C:mult}#1#{}回合后手牌上限{C:chips}+1{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_move_slower = {
                name = "缓慢移动",
                text = {
                    "{C:attention}盲注大小+200{}",
                    "{C:mult}#1#{}回合后获得一张{C:buff}增益{}卡",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_no_jump = {
                name = "无法跳跃",
                text = {
                    "必须在一手牌内击败盲注否则失败",
                    "{C:mult}#1#{}回合后手牌上限{C:mult}+3{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_less_accuracy = {
                name = "精准降低",
                text = {
                    "每回合增加{C:mult}+10%{}未命中率",
                    "{C:mult}#1#{}回合后将未命中率设为{C:green}25%{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_rubber_bullets = {
                name = "橡胶子弹",
                text = {
                    "每回合减少{C:mult}-5{}伤害",
                    "{C:mult}#1#{}回合后将伤害设为{C:mult}30 - 50{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_small_mag = {
                name = "小弹匣",
                text = {
                    "{C:mult}最大弹药量75%{}",
                    "{C:mult}#1#{}回合后将最大弹药量设为{C:red}30{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_slow_reload = {
                name = "缓慢装填",
                text = {
                    "{C:mult}装填时间+1{}",
                    "{C:mult}#1#{}回合后将装填时间设为{C:blue}2{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_invisible_hand = {
                name = "无形之手",
                text = {
                    "{C:mult}翻转手中所有卡牌",
                    "{C:mult}#1#{}回合后获得{C:money}$30{}",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_disarm = {
                name = "解除武装",
                text = {
                    "将武器替换为{C:weapon}Boira",
                    "创建一张{C:spectral}幻灵{}卡",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_poison = {
                name = "毒药",
                text = {
                    "每张打出的牌{C:white,X:mult}X0.5{}倍率",
                    "经过{C:mult}#1#{}回合后，使一张",
                    "随机的小丑牌变为{C:dark_edition}负片{}状态",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_swap_weapon = {
                name = "武器置换",
                text = {
                    "将武器替换成一把", "随机的削弱的{C:weapon}武器{}",
                    "创建一张{C:tarot}隐者{}卡(资金加倍)",
                    "{C:inactive}(之后自毁)"
                }
            },
            c_fvb_empty_mag = {
                name = "空弹匣",
                text = {
                    "将{C:weapon}武器{}的弹药量设为{C:mult}0",
                    "每移除一颗子弹获得{C:money}$2{}",
                    "{C:inactive}(之后自毁)"
                }
            }
        },
        Back = {
            b_fvb_friends_deck = {
                name = "朋友牌组",
                text = {
                    "开始时获得一张随机的",
                    "{C:purple,E:1,T:m_eternal}永恒{} {C:personality}个性{}卡"
                }
            },
            b_fvb_baba_deck = {
                name = "巴巴牌组",
                text = {
                    "开始时获得一副",
                    "{C:attention}金色{} {C:mult}红心{}牌组"
                }
            },
            b_fvb_siaro_deck = {
                name = "西亚罗牌组",
                text = {
                    "开始时获得一副",
                    "{C:green}毒药{}牌组"
                }
            },
            b_fvb_schema_deck = {
                name = "蓝图牌组",
                text = {
                    "每{C:attention}3{}个赌注",
                    "获得一张免费的{C:blue,T:j_blueprint}蓝图{}卡"
                }
            },
            b_fvb_champs_deck = {
                name = "冠军牌组",
                text = {
                    "开始时获得一副",
                    "{C:gold,T:m_lucky}幸运{}牌组"
                }
            },
            b_fvb_abyssal_deck = {
                name = "深渊牌组",
                text = {
                    "商店中的每张{C:attention}小丑{}卡",
                    "都是{C:dark_edition,T:e_negative}负片{}版本",
                    "每{C:attention}2{}个赌注减少{C:red}-1{}手牌大小"
                }
            },
        },
        Other = {
            p_fvb_basic_pack = {
                name = "基础卡包",
                text = {"包含5张", "Friends Vs. Friends专属卡牌"}
            },
            p_fvb_gold_pack = {
                name = "黄金卡包",
                text = {
                    "包含5张",
                    "{C:attention}Friends Vs. Balatro{}专属卡牌",
                    "第一张为{C:attention}多彩{}{C:weapon}武器卡"
                }
            },
            fvb_poison_seal = {
                name = "毒药",
                text = {
                    "{C:green}1/2{}概率", "获得{C:white,X:mult}X2{}倍率",
                    "{C:green}1/10{}概率", "获得{C:white,X:mult}X0.5{}倍率"
                }
            },
            undiscovered_buff = {
                name = "未发现的Buff",
                text = {"在游戏中获得此Buff", "以了解其效果"}
            },
            undiscovered_debuff = {
                name = "未发现的Debuff",
                text = {"在游戏中获得此Debuff", "以了解其效果"}
            },
            undiscovered_hotcard = {
                name = "未发现的热力卡",
                text = {"在游戏中获得此热力卡", "以了解其效果"}
            },
            undiscovered_weapon = {
                name = "未发现的武器",
                text = {"在游戏中使用", "以解锁此武器"}
            }
        },
        Weapon = {
            c_fvb_boira = {
                name = "博伊拉9",
                text = {
                    "经典之作。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_boomstick = {
                name = "霰弹枪",
                text = {
                    "近距离神器！",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_albatross = {
                name = "信天翁21",
                text = {
                    "牛顿向你问好！",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_brasshopper = {
                name = "铜蝗虫",
                text = {
                    "带点狂欢的味道。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_laika = {
                name = "莱卡",
                text = {
                    "你自找的。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_fk = {
                name = "FK-82",
                text = {
                    "高口径的朋友。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_gld_boira = {
                name = "黄金博伊拉",
                text = {
                    "黄金标准。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_punchr = {
                name = "重拳-R",
                text = {
                    "拉斯的专长。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            },
            c_fvb_katana = {
                name = "武士刀",
                text = {
                    "来自萨布的礼物。",
                    "{C:mult}+#1#-#2#{} 倍率",
                    "{C:green}#3#%{} 未命中率",
                    "{C:blue}#5#{} 回合装填时间",
                    "{C:inactive}(弹药: #4#)",
                }
            }
        }
    },
    misc = {
        challenge_names = {
            c_fvb_the_trio = "三重奏"
        },
        v_text = {
            ch_c_onlyqueens = {
                "牌组中所有人头牌",
                "都是{C:attention}皇后{}"
            }
        },
        dictionary = {
            b_buff_cards = "强化卡组",
            b_debuff_cards = "弱化卡组",
            b_weapon_cards = "军械库",
            b_hotcard_cards = "热力卡组",
            k_fvb_again = "再来一次！",
            k_fvb_accel = "加速中",
            k_fvb_upgraded = "已升级！",
            k_fvb_buffed = "已强化！",
            k_fvb_reduced = "已削弱！",
            k_fvb_reset = "已重置！",
            k_fvb_won = "通关！",
            k_fvb_gains = "获得收益",
            k_fvb_hit = "命中！",
            k_fvb_missed = "未命中！",
            k_fvb_reloading = "装填中...",
            k_fvb_reloaded = "装填完成！",
            k_fvb_currently = "当前状态",
            k_fvb_until_reload = " 回合后需要装填",
            k_fvb_personality = "个性卡",
            k_buff = "Buff",
            k_debuff = "Debuff",
            k_weapon = "武器",
            k_hotcard = "热力卡"
        },
        labels = {
            fvb_poison_seal = "毒药封印",
        }
    }
}
