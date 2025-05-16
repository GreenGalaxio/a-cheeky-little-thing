// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.sidesmash_26

package peach_fla
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

    public dynamic class sidesmash_26 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var reverseBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var randomStarter:Number;
        public var peachRandom:Number;
        public var peachWeapon:String;
        public var newStats:Object;
        public var Pan:*;
        public var Golf:*;

        public function sidesmash_26()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 7, this.frame8, 12, this.frame13, 13, this.frame14, 15, this.frame16, 16, this.frame17, 27, this.frame28, 28, this.frame29, 32, this.frame33, 37, this.frame38, 38, this.frame39, 40, this.frame41, 52, this.frame53, 53, this.frame54, 57, this.frame58, 62, this.frame63, 63, this.frame64, 65, this.frame66, 77, this.frame78);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.randomStarter = SSF2API.random();
                this.peachRandom = 0;
                this.peachWeapon = this.self.getGlobalVariable("peachLast");
                if (this.peachWeapon == "Tennis")
                {
                    this.peachRandom = Math.round((this.randomStarter * 2));
                    if (((this.peachRandom >= 0) && (this.peachRandom <= 1)))
                    {
                        this.self.setGlobalVariable("peachLast", "Golf");
                        this.peachWeapon = "Golf";
                        gotoAndPlay("Golf");
                    }
                    else
                    {
                        if (((this.peachRandom > 1) && (this.peachRandom <= 2)))
                        {
                            this.self.setGlobalVariable("peachLast", "Pan");
                            this.peachWeapon = "Pan";
                            gotoAndPlay("Pan");
                        }
                        else
                        {
                            this.self.endAttack();
                        };
                    };
                }
                else
                {
                    if (this.peachWeapon == "Golf")
                    {
                        this.peachRandom = Math.round((this.randomStarter * 2));
                        if (((this.peachRandom >= 0) && (this.peachRandom <= 1)))
                        {
                            this.self.setGlobalVariable("peachLast", "Pan");
                            this.peachWeapon = "Pan";
                            gotoAndPlay("Pan");
                        }
                        else
                        {
                            if (((this.peachRandom > 1) && (this.peachRandom <= 2)))
                            {
                                this.self.setGlobalVariable("peachLast", "Tennis");
                                this.peachWeapon = "Tennis";
                                gotoAndPlay("Tennis");
                            }
                            else
                            {
                                this.self.endAttack();
                            };
                        };
                    }
                    else
                    {
                        if (this.peachWeapon == "Pan")
                        {
                            this.peachRandom = Math.round((this.randomStarter * 2));
                            if (((this.peachRandom >= 0) && (this.peachRandom <= 1)))
                            {
                                this.self.setGlobalVariable("peachLast", "Tennis");
                                this.peachWeapon = "Tennis";
                                gotoAndPlay("Tennis");
                            }
                            else
                            {
                                if (((this.peachRandom > 1) && (this.peachRandom <= 2)))
                                {
                                    this.self.setGlobalVariable("peachLast", "Golf");
                                    this.peachWeapon = "Golf";
                                    gotoAndPlay("Golf");
                                }
                                else
                                {
                                    this.self.endAttack();
                                };
                            };
                        }
                        else
                        {
                            this.peachRandom = Math.round((this.randomStarter * 3));
                            if (((this.peachRandom >= 0) && (this.peachRandom < 1)))
                            {
                                this.self.setGlobalVariable("peachLast", "Golf");
                                this.peachWeapon = "Golf";
                                gotoAndPlay("Golf");
                            }
                            else
                            {
                                if (((this.peachRandom >= 1) && (this.peachRandom < 2)))
                                {
                                    this.self.setGlobalVariable("peachLast", "Pan");
                                    this.peachWeapon = "Pan";
                                    gotoAndPlay("Pan");
                                }
                                else
                                {
                                    if (((this.peachRandom >= 2) && (this.peachRandom <= 3)))
                                    {
                                        this.self.setGlobalVariable("peachLast", "Tennis");
                                        this.peachWeapon = "Tennis";
                                        gotoAndPlay("Tennis");
                                    }
                                    else
                                    {
                                        this.self.endAttack();
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame2():*
        {
            if (this.peachWeapon == "Tennis")
            {
                gotoAndPlay("attackT");
            }
            else
            {
                if (this.peachWeapon == "Pan")
                {
                    gotoAndPlay("attackP");
                }
                else
                {
                    if (this.peachWeapon == "Golf")
                    {
                        gotoAndPlay("attackG");
                    }
                    else
                    {
                        this.self.endAttack();
                    };
                };
            };
        }

        internal function frame3():*
        {
            if (this.peachWeapon == "Tennis")
            {
                gotoAndPlay("attackT");
            }
            else
            {
                if (this.peachWeapon == "Pan")
                {
                    gotoAndPlay("attackP");
                }
                else
                {
                    if (this.peachWeapon == "Golf")
                    {
                        gotoAndPlay("attackG");
                    }
                    else
                    {
                        this.self.endAttack();
                    };
                };
            };
        }

        internal function frame8():*
        {
            this.xframe = "charging";
        }

        internal function frame13():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame14():*
        {
            this.xframe = "attack";
        }

        internal function frame16():*
        {
            this.newStats = {
                "kbConstant":60,
                "power":40,
                "damage":13,
                "direction":28,
                "reverse_projectile":true,
                "effectSound":"tennis"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.updateAttackBoxStats(2, this.newStats);
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame17():*
        {
            this.newStats = {
                "kbConstant":60,
                "power":40,
                "damage":12
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.updateAttackBoxStats(2, this.newStats);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }

        internal function frame29():*
        {
            this.Pan = true;
        }

        internal function frame33():*
        {
            this.xframe = "charging";
        }

        internal function frame38():*
        {
            this.gotoAndPlay("charging2");
        }

        internal function frame39():*
        {
            this.xframe = "attack";
        }

        internal function frame41():*
        {
            this.newStats = {
                "kbConstant":68,
                "power":30,
                "damage":18,
                "direction":80,
                "reverse_projectile":false,
                "effectSound":"fryingpan"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.updateAttackBoxStats(2, this.newStats);
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame53():*
        {
            this.self.endAttack();
        }

        internal function frame54():*
        {
            this.Golf = true;
        }

        internal function frame58():*
        {
            this.xframe = "charging";
        }

        internal function frame63():*
        {
            this.gotoAndPlay("charging3");
        }

        internal function frame64():*
        {
            this.xframe = "attack";
        }

        internal function frame66():*
        {
            this.newStats = {
                "kbConstant":70,
                "power":50,
                "damage":15,
                "direction":45,
                "reverse_projectile":false,
                "effectSound":"golfclub"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.updateAttackBoxStats(2, this.newStats);
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame78():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

