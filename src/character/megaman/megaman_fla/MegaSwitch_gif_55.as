// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.MegaSwitch_gif_55

package megaman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class MegaSwitch_gif_55 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var switchCase:Number;
        public var timer:*;
        public var controls:Object;

        public function MegaSwitch_gif_55()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 12, this.frame13, 17, this.frame18, 18, this.frame19, 21, this.frame22, 26, this.frame27, 27, this.frame28, 30, this.frame31, 35, this.frame36, 36, this.frame37, 39, this.frame40, 44, this.frame45, 45, this.frame46, 46, this.frame47);
        }

        public function menu():void
        {
            this.timer--;
            if (this.timer < 0)
            {
                SSF2API.destroyTimer(this.self, this.menu);
                gotoAndPlay("end");
            };
            if (this.switchCase == 0)
            {
                this.self.attachEffectOverlay("buster_menu_glow");
            }
            else
            {
                this.self.attachEffectOverlay("buster_menu_trans");
            };
            if (this.switchCase == 1)
            {
                this.self.attachEffectOverlay("block_menu_glow", {
                    "x":0,
                    "y":-60
                });
            }
            else
            {
                this.self.attachEffectOverlay("block_menu_trans", {
                    "x":0,
                    "y":-60
                });
            };
            if (this.switchCase == 2)
            {
                this.self.attachEffectOverlay("bomb_menu_glow", {
                    "x":50,
                    "y":0
                });
            }
            else
            {
                this.self.attachEffectOverlay("bomb_menu_trans", {
                    "x":50,
                    "y":0
                });
            };
            if (this.switchCase == 3)
            {
                this.self.attachEffectOverlay("BHB_menu_glow", {
                    "x":-50,
                    "y":0
                });
            }
            else
            {
                this.self.attachEffectOverlay("BHB_menu_trans", {
                    "x":-50,
                    "y":0
                });
            };
            if (this.switchCase == 4)
            {
                this.self.attachEffectOverlay("blade_menu_glow", {
                    "x":0,
                    "y":60
                });
            }
            else
            {
                this.self.attachEffectOverlay("blade_menu_trans", {
                    "x":0,
                    "y":60
                });
            };
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                SSF2API.destroyTimer(this.self, this.menu);
                switch (this.switchCase)
                {
                    case 0:
                        gotoAndPlay("moveBuster");
                        break;
                    case 1:
                        gotoAndPlay("moveBlock");
                        break;
                    case 2:
                        gotoAndPlay("moveBomb");
                        break;
                    case 3:
                        gotoAndPlay("moveBHB");
                        break;
                    case 4:
                        gotoAndPlay("moveBlade");
                        break;
                    default:
                        gotoAndPlay("moveBuster");
                };
            }
            else
            {
                if (this.controls.RIGHT == true)
                {
                    this.switchCase = 2;
                    gotoAndPlay("loopBomb");
                }
                else
                {
                    if (this.controls.LEFT == true)
                    {
                        this.switchCase = 3;
                        gotoAndPlay("loopBHB");
                    }
                    else
                    {
                        if (this.controls.DOWN == true)
                        {
                            this.switchCase = 4;
                            gotoAndPlay("loopBlade");
                        }
                        else
                        {
                            if (this.controls.UP == true)
                            {
                                this.switchCase = 1;
                                gotoAndPlay("loopBlock");
                            }
                            else
                            {
                                this.switchCase = 0;
                                gotoAndPlay("loopBuster");
                            };
                        };
                    };
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.switchCase = 0;
            this.timer = 60;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.self.playAttackSound(2);
                SSF2API.createTimer(this.self, 1, 0, this.menu);
            };
        }

        internal function frame4():*
        {
            this.self.setGlobalVariable("weapon", 0);
        }

        internal function frame9():*
        {
            this.self.switchAttackData("b", "switchBuster", "b_down");
            this.self.switchAttackData("b_air", "switch6", "b_down_air");
            this.self.setGlobalVariable("playEffect", 0);
            this.self.playAttackSound(1);
        }

        internal function frame10():*
        {
            this.self.endAttack();
        }

        internal function frame13():*
        {
            this.self.setGlobalVariable("weapon", 1);
        }

        internal function frame18():*
        {
            this.self.setGlobalVariable("playEffect", 3);
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.endAttack();
        }

        internal function frame22():*
        {
            this.self.setGlobalVariable("weapon", 2);
        }

        internal function frame27():*
        {
            this.self.switchAttackData("b", "switchBomb", "b_down");
            this.self.switchAttackData("b_air", "switchBomb", "b_down_air");
            this.self.setGlobalVariable("playEffect", 3);
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame31():*
        {
            this.self.setGlobalVariable("weapon", 3);
        }

        internal function frame36():*
        {
            this.self.switchAttackData("b", "switchBHB", "b_down");
            this.self.switchAttackData("b_air", "switchBHB", "b_down_air");
            this.self.setGlobalVariable("playEffect", 3);
            this.self.playAttackSound(1);
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }

        internal function frame40():*
        {
            this.self.setGlobalVariable("weapon", 4);
        }

        internal function frame45():*
        {
            this.self.switchAttackData("b", "switchBlade", "b_down");
            this.self.switchAttackData("b_air", "switchBlade", "b_down_air");
            this.self.setGlobalVariable("playEffect", 3);
            this.self.playAttackSound(1);
        }

        internal function frame46():*
        {
            this.self.endAttack();
        }

        internal function frame47():*
        {
            switch (this.switchCase)
            {
                case 0:
                    gotoAndPlay("moveBuster");
                    return;
                case 1:
                    gotoAndPlay("moveBlock");
                    return;
                case 2:
                    gotoAndPlay("moveBomb");
                    return;
                case 3:
                    gotoAndPlay("moveBHB");
                    return;
                case 4:
                    gotoAndPlay("moveBlade");
                    return;
                default:
                    gotoAndPlay("moveBuster");
            };
        }


    }
}//package megaman_fla

