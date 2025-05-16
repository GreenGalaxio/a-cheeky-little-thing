// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_downBair_133

package naruto_fla
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

    public dynamic class naruto_downBair_133 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var onGround:*;
        public var facing:*;
        public var soundPlayed:*;
        public var reverse:Boolean;
        public var opposite:Number;
        public var fired:*;
        public var xframe:String;
        public var playsound:Number;
        public var audio:Number;
        public var controls:Object;
        public var buttonCount:Number;
        public var airClone:*;

        public function naruto_downBair_133()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 14, this.frame15, 16, this.frame17, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 24, this.frame25, 25, this.frame26, 26, this.frame27, 27, this.frame28, 28, this.frame29, 29, this.frame30, 31, this.frame32, 33, this.frame34);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
                this.onGround = this.self.isOnGround();
                this.facing = this.self.isFacingRight();
                this.soundPlayed = false;
                this.reverse = false;
                this.opposite = 0;
                this.fired = false;
                this.self.setGlobalVariable("cloneStartedGround", false);
            };
            this.xframe = "start1";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                if (this.self.isOnGround())
                {
                    gotoAndPlay("start");
                };
            };
        }

        internal function frame3():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = 1;
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame4():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
            this.self.attachEffect("naruto_summonClone");
            if (this.self.isOnGround())
            {
                gotoAndPlay("handClasp");
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
                if (this.buttonCount >= 5)
                {
                    this.airClone = true;
                };
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame8():*
        {
            if (this.self.isOnGround())
            {
                gotoAndPlay("finishedChecks");
            };
        }

        internal function frame9():*
        {
            if (((this.reverse == true) || (this.onGround == false)))
            {
                this.self.fireProjectile("naruto_clone", -100, 0);
                this.fired = true;
                if (((((!(this.soundPlayed)) && (this.playsound > 0.2)) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    SSF2API.playSound("naruto_attack1");
                    this.self.setGlobalVariable("audio", 1);
                };
                if (((((!(this.soundPlayed)) && (this.playsound > 0.4)) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    SSF2API.playSound("naruto_attack2");
                    this.self.setGlobalVariable("audio", 2);
                };
                if (((((!(this.soundPlayed)) && (this.playsound > 0.6)) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    SSF2API.playSound("naruto_attack3");
                    this.self.setGlobalVariable("audio", 3);
                };
                if (((((!(this.soundPlayed)) && (this.playsound > 0.8)) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    SSF2API.playSound("naruto_attack4");
                    this.self.setGlobalVariable("audio", 4);
                };
                SSF2API.playSound("whoosh1");
            };
            if (this.self.isOnGround())
            {
                gotoAndPlay("shootProjectile1");
            };
        }

        internal function frame10():*
        {
            if (this.self.isOnGround())
            {
                gotoAndPlay("afterShoot1");
            };
        }

        internal function frame11():*
        {
            if (this.onGround == true)
            {
                if (this.reverse == false)
                {
                    this.self.fireProjectile("naruto_clone");
                    this.fired = true;
                };
            }
            else
            {
                this.self.fireProjectile("naruto_clone");
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                if (((((!(this.soundPlayed)) && (this.playsound > 0.2)) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                {
                    SSF2API.playSound("naruto_attack1");
                    this.self.setGlobalVariable("audio", 1);
                };
                if (((((!(this.soundPlayed)) && (this.playsound > 0.4)) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                {
                    SSF2API.playSound("naruto_attack2");
                    this.self.setGlobalVariable("audio", 2);
                };
                if (((((!(this.soundPlayed)) && (this.playsound > 0.6)) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                {
                    SSF2API.playSound("naruto_attack3");
                    this.self.setGlobalVariable("audio", 3);
                };
                if (((((!(this.soundPlayed)) && (this.playsound > 0.8)) && (this.playsound <= 1)) && (!(this.audio == 4))))
                {
                    SSF2API.playSound("naruto_attack4");
                    this.self.setGlobalVariable("audio", 4);
                };
            };
            this.self.playAttackSound(2);
            if (this.self.isOnGround())
            {
                gotoAndPlay("shootProjectile2");
            };
        }

        internal function frame12():*
        {
            if (this.self.isOnGround())
            {
                gotoAndPlay("afterShoot2");
            };
        }

        internal function frame13():*
        {
            if (!this.onGround)
            {
                this.self.setAttackEnabled(false, "b_down_air");
            };
        }

        internal function frame15():*
        {
            if (this.self.isOnGround())
            {
                gotoAndPlay("handRelease");
            };
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }

        internal function frame20():*
        {
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame21():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame22():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
            this.self.attachEffect("naruto_summonClone");
            this.xframe = "handClasp";
        }

        internal function frame23():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1 == true)
            {
                this.buttonCount = (this.buttonCount + 1);
            };
            if ((((this.controls.RIGHT == true) && (!(this.facing == true))) || ((this.controls.LEFT == true) && (this.facing == true))))
            {
                this.opposite = (this.opposite + 1);
                if (this.opposite >= 1)
                {
                    this.reverse = true;
                };
            };
        }

        internal function frame25():*
        {
            this.xframe = "finishedChecks";
        }

        internal function frame26():*
        {
            if (!this.fired)
            {
                if (((this.reverse == true) || (this.onGround == false)))
                {
                    this.self.fireProjectile("naruto_clone", -100, 0);
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.2)) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                    {
                        SSF2API.playSound("naruto_attack1");
                        this.self.setGlobalVariable("audio", 1);
                    };
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.4)) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                    {
                        SSF2API.playSound("naruto_attack2");
                        this.self.setGlobalVariable("audio", 2);
                    };
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.6)) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                    {
                        SSF2API.playSound("naruto_attack3");
                        this.self.setGlobalVariable("audio", 3);
                    };
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.8)) && (this.playsound <= 1)) && (!(this.audio == 4))))
                    {
                        SSF2API.playSound("naruto_attack4");
                        this.self.setGlobalVariable("audio", 4);
                    };
                    SSF2API.playSound("whoosh1");
                };
            };
        }

        internal function frame27():*
        {
            this.xframe = "afterShoot1";
        }

        internal function frame28():*
        {
            if (((this.onGround == true) && (!(this.fired))))
            {
                if (this.reverse == false)
                {
                    this.self.fireProjectile("naruto_clone2");
                };
            }
            else
            {
                if (!this.onGround)
                {
                    this.self.fireProjectile("naruto_clone");
                    this.playsound = SSF2API.random();
                    this.audio = this.self.getGlobalVariable("audio");
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.2)) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
                    {
                        SSF2API.playSound("naruto_attack1");
                        this.self.setGlobalVariable("audio", 1);
                    };
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.4)) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
                    {
                        SSF2API.playSound("naruto_attack2");
                        this.self.setGlobalVariable("audio", 2);
                    };
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.6)) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
                    {
                        SSF2API.playSound("naruto_attack3");
                        this.self.setGlobalVariable("audio", 3);
                    };
                    if (((((!(this.soundPlayed)) && (this.playsound > 0.8)) && (this.playsound <= 1)) && (!(this.audio == 4))))
                    {
                        SSF2API.playSound("naruto_attack4");
                        this.self.setGlobalVariable("audio", 4);
                    };
                };
            };
            this.self.playAttackSound(2);
        }

        internal function frame29():*
        {
            this.xframe = "afterShoot2";
        }

        internal function frame30():*
        {
            if (!this.onGround)
            {
                this.self.setAttackEnabled(false, "b_down_air");
            };
        }

        internal function frame32():*
        {
            this.xframe = "handRelease";
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

