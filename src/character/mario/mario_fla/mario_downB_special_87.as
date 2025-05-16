// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_downB_special_87

package mario_fla
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

    public dynamic class mario_downB_special_87 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var controls:Object;
        public var pressed:Boolean;
        public var yVel:*;
        public var timeSinceLastPressed:*;
        public var timeSinceLastPressedLimit:*;
        public var riseAmt:*;
        public var riseAmtMax:*;
        public var riseAmtIncr:*;
        public var canStartRise:Boolean;
        public var risen:Boolean;

        public function mario_downB_special_87()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 23, this.frame24, 24, this.frame25, 25, this.frame26, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.pressed = true;
            this.timeSinceLastPressed = 0;
            this.timeSinceLastPressedLimit = 4;
            this.riseAmt = -6;
            this.riseAmtMax = -12;
            this.riseAmtIncr = -2;
            this.canStartRise = true;
            this.risen = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
            };
        }

        internal function frame2():*
        {
            this.canStartRise = this.self.getGlobalVariable("canStartRise");
            this.controls = this.self.getControls();
            if (((this.pressed) && (!(this.controls.BUTTON1))))
            {
                this.pressed = false;
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (((this.pressed) && (!(this.controls.BUTTON1))))
            {
                this.pressed = false;
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (((this.pressed) && (!(this.controls.BUTTON1))))
            {
                this.pressed = false;
            };
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (((this.pressed) && (!(this.controls.BUTTON1))))
            {
                this.pressed = false;
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_hoo");
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
            this.self.modifyAirEase(-1);
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame8():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame12():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (!this.risen)
            {
                this.canStartRise = false;
                this.self.setGlobalVariable("canStartRise", false);
            };
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
        }

        internal function frame13():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (!this.risen)
            {
                this.canStartRise = false;
                this.self.setGlobalVariable("canStartRise", false);
            };
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (!this.risen)
            {
                this.canStartRise = false;
                this.self.setGlobalVariable("canStartRise", false);
            };
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            this.self.setGlobalVariable("canStartRise", false);
        }

        internal function frame16():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_hoo");
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
            this.self.modifyAirEase(-1);
        }

        internal function frame19():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame20():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
        }

        internal function frame21():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame22():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (!this.risen)
            {
                this.canStartRise = false;
                this.self.setGlobalVariable("canStartRise", false);
            };
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
            this.self.refreshAttackID();
        }

        internal function frame23():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (!this.risen)
            {
                this.canStartRise = false;
                this.self.setGlobalVariable("canStartRise", false);
            };
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
        }

        internal function frame24():*
        {
            this.controls = this.self.getControls();
            this.yVel = this.self.getYSpeed();
            if (!this.risen)
            {
                this.canStartRise = false;
                this.self.setGlobalVariable("canStartRise", false);
            };
            if (this.canStartRise)
            {
                this.timeSinceLastPressed++;
                if (((this.pressed) && (!(this.controls.BUTTON1))))
                {
                    this.pressed = false;
                };
                if (((this.controls.BUTTON1) && (!(this.pressed))))
                {
                    this.pressed = true;
                    this.risen = true;
                    this.timeSinceLastPressed = 0;
                    this.riseAmt = (this.riseAmt + this.riseAmtIncr);
                    if (this.riseAmt < this.riseAmtMax)
                    {
                        this.riseAmt = this.riseAmtMax;
                    };
                };
                if (this.timeSinceLastPressed > this.timeSinceLastPressedLimit)
                {
                    this.canStartRise = false;
                    this.self.setGlobalVariable("canStartRise", false);
                }
                else
                {
                    if (this.risen)
                    {
                        this.self.setYSpeed(this.riseAmt);
                    };
                };
            };
            SSF2API.playSound("mario_spin");
        }

        internal function frame25():*
        {
            this.self.setGlobalVariable("canStartRise", false);
        }

        internal function frame26():*
        {
            this.self.modifyAttackPower(80);
            this.self.modifyWeightKB(0);
            this.self.modifyKBConstant(80);
            this.self.modifyAttackDamage(7);
            this.self.modifyMagnet(false);
            this.self.modifyAttackDirection(95);
            this.self.refreshAttackID();
            SSF2API.playSound("mario_ha");
            this.self.modifyEffectSound("ssb_hit2");
            this.self.setYSpeed(-7);
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

