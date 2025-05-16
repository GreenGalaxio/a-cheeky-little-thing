// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_nspec_air_40

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

    public dynamic class chibi_nspec_air_40 extends MovieClip 
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

        public function chibi_nspec_air_40()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 28, this.frame29, 29, this.frame30, 32, this.frame33);
        }

        public function refreshTimers():void
        {
            SSF2API.destroyTimer(this.self, this.testButton);
            SSF2API.destroyTimer(this.self, this.fire);
            SSF2API.createTimer(this.self, 1, 0, this.testButton);
            SSF2API.createTimer(this.self, 7, 0, this.fire);
        }

        public function testButton():void
        {
            this.controls = this.self.getControls();
            this.localBlaster = this.self.getGlobalVariable("blasterAngle");
            if (((this.controls.BUTTON1) || (this.hasntFired)))
            {
                if (((this.controls.DOWN) && (this.localBlaster > 270)))
                {
                    this.localBlaster = (this.localBlaster - 10);
                }
                else
                {
                    if (((this.controls.UP) && (this.localBlaster < 360)))
                    {
                        this.localBlaster = (this.localBlaster + 10);
                    };
                };
                if (this.currentLabel != "fire")
                {
                    this.self.setGlobalVariable("blasterAngle", this.localBlaster);
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
            if (this.localBlaster == 360)
            {
                this.self.fireProjectile("chibi_blaster", -8, 4);
            }
            else
            {
                if (this.localBlaster == 350)
                {
                    this.self.fireProjectile("chibi_blaster", -6, 6);
                }
                else
                {
                    if (this.localBlaster == 340)
                    {
                        this.self.fireProjectile("chibi_blaster", -4, 8);
                    }
                    else
                    {
                        if (this.localBlaster == 330)
                        {
                            this.self.fireProjectile("chibi_blaster", -2, 10);
                        }
                        else
                        {
                            if (this.localBlaster == 320)
                            {
                                this.self.fireProjectile("chibi_blaster", 0, 12);
                            }
                            else
                            {
                                if (this.localBlaster == 310)
                                {
                                    this.self.fireProjectile("chibi_blaster", 2, 14);
                                }
                                else
                                {
                                    if (this.localBlaster == 300)
                                    {
                                        this.self.fireProjectile("chibi_blaster", 0, 16);
                                    }
                                    else
                                    {
                                        if (this.localBlaster == 290)
                                        {
                                            this.self.fireProjectile("chibi_blaster", -2, 18);
                                        }
                                        else
                                        {
                                            if (this.localBlaster == 280)
                                            {
                                                this.self.fireProjectile("chibi_blaster", -8, 20);
                                            }
                                            else
                                            {
                                                if (this.localBlaster == 270)
                                                {
                                                    this.self.fireProjectile("chibi_blaster", -12, 22);
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
            if (((this.self) && (SSF2API.isReady())))
            {
                this.controls = this.self.getControls();
                this.self.setGlobalVariable("blasterAngle", 360);
                SSF2API.destroyTimer(this.self, this.testButton);
                SSF2API.destroyTimer(this.self, this.fire);
                this.localBlaster = this.self.getGlobalVariable("blasterAngle");
                if (this.localBlaster == null)
                {
                    this.localBlaster = 360;
                };
            };
        }

        internal function frame6():*
        {
            this.refreshTimers();
            this.xframe = "shoot";
        }

        internal function frame29():*
        {
            stop();
        }

        internal function frame30():*
        {
            this.hasntFired = false;
            this.xframe = "fire";
            this.refreshTimers();
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
            this.self.updateAttackStats({"linkFrames":false});
        }

        internal function frame33():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

