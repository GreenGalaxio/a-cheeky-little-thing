// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_nspec_36

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class chibi_nspec_36 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;
        public var redirectBlaster:*;
        public var projectile:*;
        public var hasntFired:*;
        public var playsound:*;
        public var xframe:*;
        public var controls:Object;
        public var localBlaster:*;

        public function chibi_nspec_36()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 29, this.frame30, 30, this.frame31, 36, this.frame37);
        }

        public function testButton():void
        {
            this.controls = this.self.getControls();
            this.localBlaster = this.self.getGlobalVariable("blasterAngle");
            if (((this.controls.BUTTON1) || (this.hasntFired)))
            {
                if (((this.controls.UP) && (this.localBlaster < 90)))
                {
                    this.localBlaster = (this.localBlaster + 10);
                }
                else
                {
                    if (((this.controls.DOWN) && (this.localBlaster > 0)))
                    {
                        this.localBlaster = (this.localBlaster - 10);
                    };
                };
                this.self.setGlobalVariable("blasterAngle", this.localBlaster);
                if (this.currentLabel != "fire")
                {
                    this.redirectBlaster = ("degree" + this.localBlaster);
                    gotoAndPlay(this.redirectBlaster);
                };
            }
            else
            {
                if (this.currentLabel != "fire")
                {
                    SSF2API.destroyTimer(this.self, this.testButton);
                    SSF2API.destroyTimer(this.self, this.fire);
                    this.self.endAttack();
                };
            };
        }

        public function fire():void
        {
            this.gotoAndPlay("fire");
            this.hasntFired = false;
            if (this.localBlaster == 0)
            {
                this.self.fireProjectile("chibi_blaster", -8, 4);
            }
            else
            {
                if (this.localBlaster == 10)
                {
                    this.self.fireProjectile("chibi_blaster", -10, 2);
                }
                else
                {
                    if (this.localBlaster == 20)
                    {
                        this.self.fireProjectile("chibi_blaster", -12, 0);
                    }
                    else
                    {
                        if (this.localBlaster == 30)
                        {
                            this.self.fireProjectile("chibi_blaster", -14, -2);
                        }
                        else
                        {
                            if (this.localBlaster == 40)
                            {
                                this.self.fireProjectile("chibi_blaster", -16, -4);
                            }
                            else
                            {
                                if (this.localBlaster == 50)
                                {
                                    this.self.fireProjectile("chibi_blaster", -18, -6);
                                }
                                else
                                {
                                    if (this.localBlaster == 60)
                                    {
                                        this.self.fireProjectile("chibi_blaster", -20, -8);
                                    }
                                    else
                                    {
                                        if (this.localBlaster == 70)
                                        {
                                            this.self.fireProjectile("chibi_blaster", -22, -10);
                                        }
                                        else
                                        {
                                            if (this.localBlaster == 80)
                                            {
                                                this.self.fireProjectile("chibi_blaster", -24, -12);
                                            }
                                            else
                                            {
                                                if (this.localBlaster == 90)
                                                {
                                                    this.self.fireProjectile("chibi_blaster", -28, -14);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.hasntFired = true;
            this.xframe = "startup";
            if ((((parent) && (this.self)) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.self.setGlobalVariable("blasterAngle", 0);
                this.localBlaster = this.self.getGlobalVariable("blasterAngle");
                if (this.localBlaster == null)
                {
                    this.localBlaster = 0;
                };
            };
        }

        internal function frame6():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.testButton);
            SSF2API.createTimer(this.self, 10, 0, this.fire);
            this.xframe = "shoot";
        }

        internal function frame30():*
        {
            stop();
        }

        internal function frame31():*
        {
            this.playsound = SSF2API.random();
            if (((this.playsound > 0) && (this.playsound <= 0.25)))
            {
                SSF2API.playSound("chibi_Spoon1");
            };
            if (((this.playsound > 0.25) && (this.playsound <= 0.5)))
            {
                SSF2API.playSound("chibi_Spoon2");
            };
            if (((this.playsound > 0.5) && (this.playsound <= 0.75)))
            {
                SSF2API.playSound("chibi_Spoon3");
            };
            if (((this.playsound > 0.75) && (this.playsound <= 1)))
            {
                SSF2API.playSound("chibi_Spoon4");
            };
            this.xframe = "fire";
            this.self.updateAttackStats({"linkFrames":false});
        }

        internal function frame37():*
        {
            if (this.controls.BUTTON1)
            {
                gotoAndPlay(this.redirectBlaster);
            }
            else
            {
                this.self.endAttack();
            };
        }


    }
}//package chibirobo_fla

