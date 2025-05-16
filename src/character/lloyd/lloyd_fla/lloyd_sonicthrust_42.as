// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_sonicthrust_42

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class lloyd_sonicthrust_42 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var controls:Object;
        public var xframe:String;
        public var disable:Boolean;
        public var skipping:Boolean;
        public var unpressed:Boolean;
        public var onground:Boolean;
        public var soniccharge:Number;

        public function lloyd_sonicthrust_42()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 28, this.frame29);
        }

        public function artesCheck():void
        {
            if (((this.controls.DOWN) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
            if (((this.controls.UP) && (this.controls.BUTTON1)))
            {
                this.unpressed = false;
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.xframe = "charging";
                this.disable = this.self.getGlobalVariable("upSpecUsed");
                this.skipping = this.self.getGlobalVariable("nairUsed");
                this.unpressed = true;
                this.onground = this.self.isOnGround();
                if (this.disable)
                {
                    SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                };
                if (this.skipping == false)
                {
                    this.self.attachEffectOverlay("bigSonicThrustGlow");
                };
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame3():*
        {
            this.xframe = "attack";
            this.soniccharge = 0;
            this.self.playVoiceSound(2);
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
        }

        internal function frame5():*
        {
        }

        internal function frame6():*
        {
            if (this.soniccharge <= 20)
            {
                this.self.setXSpeed(3, false);
            };
            if (((this.soniccharge > 20) && (this.soniccharge <= 40)))
            {
                this.self.setXSpeed(6, false);
            };
            if (((this.soniccharge > 40) && (this.soniccharge < 80)))
            {
                this.self.setXSpeed(9, false);
            };
            if (this.soniccharge >= 80)
            {
                this.self.setXSpeed(12, false);
            };
        }

        internal function frame7():*
        {
            if (this.skipping)
            {
                this.self.setXSpeed(7, false);
            };
            this.self.setGlobalVariable("nairUsed", false);
        }

        internal function frame8():*
        {
        }

        internal function frame9():*
        {
        }

        internal function frame10():*
        {
        }

        internal function frame11():*
        {
        }

        internal function frame12():*
        {
        }

        internal function frame13():*
        {
        }

        internal function frame14():*
        {
        }

        internal function frame15():*
        {
        }

        internal function frame16():*
        {
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

