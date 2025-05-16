// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_specialS_63

package fox_fla
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

    public dynamic class fox_specialS_63 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var controls:*;
        public var canCancel:Boolean;
        public var cancel:Boolean;

        public function fox_specialS_63()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 13, this.frame14, 16, this.frame17, 19, this.frame20, 21, this.frame22, 30, this.frame31, 31, this.frame32, 33, this.frame34, 40, this.frame41, 47, this.frame48);
        }

        public function moveIt():void
        {
            this.self.setXSpeed(50, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
            };
        }

        internal function frame2():*
        {
            this.controls = this.self.getControls();
            this.canCancel = true;
            this.cancel = false;
        }

        internal function frame5():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.canCancel = false;
            };
        }

        internal function frame6():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.canCancel = false;
            };
        }

        internal function frame7():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canCancel)))
            {
                this.cancel = true;
            };
        }

        internal function frame8():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canCancel)))
            {
                this.cancel = true;
            };
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            if (((this.controls.BUTTON1) && (this.canCancel)))
            {
                this.cancel = true;
            };
        }

        internal function frame10():*
        {
            this.self.playAttackSound(2);
            this.self.playVoiceSound(1);
            this.controls = this.self.getControls();
            if ((((this.controls.BUTTON1) || (this.cancel)) && (this.canCancel)))
            {
                gotoAndPlay("cancelled");
            };
            SSF2API.createTimer(this.self, 1, 4, this.moveIt);
        }

        internal function frame14():*
        {
            this.self.setXSpeed(11, false);
        }

        internal function frame17():*
        {
            this.self.updateAttackBoxStats(1, {"damage":3});
        }

        internal function frame20():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "canFallOff":true,
                "xSpeedDecay":-0.1,
                "xSpeedDecayAir":-0.1
            });
        }

        internal function frame22():*
        {
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"cancelWhenAirborne":true});
            };
            this.self.updateAttackStats({"xSpeedDecay":0});
            SSF2API.createTimer(this.self, 1, 10, function ():*
            {
                if (self.isOnGround())
                {
                    self.updateAttackStats({"cancelWhenAirborne":true});
                };
            });
        }

        internal function frame31():*
        {
            this.self.toHelpless();
            this.self.endAttack();
        }

        internal function frame32():*
        {
            SSF2API.destroyTimer(this.self, this.moveIt);
        }

        internal function frame34():*
        {
            this.self.updateAttackStats({
                "xSpeedDecay":0,
                "xSpeedDecayAir":0
            });
            this.self.setXSpeed(11, false);
        }

        internal function frame41():*
        {
            this.self.updateAttackStats({
                "air_ease":-1,
                "xSpeedDecay":0,
                "xSpeedDecayAir":-0.5
            });
            if (this.self.isOnGround())
            {
                this.self.updateAttackStats({"cancelWhenAirborne":true});
            };
        }

        internal function frame48():*
        {
            this.self.toHelpless();
            this.self.endAttack();
        }


    }
}//package fox_fla

