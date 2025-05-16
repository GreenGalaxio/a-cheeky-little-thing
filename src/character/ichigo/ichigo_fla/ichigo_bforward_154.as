// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_bforward_154

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
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

    public dynamic class ichigo_bforward_154 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var hasHit:Boolean;
        public var controls:Object;
        public var xframe:String;
        public var chargeTime:*;
        public var speedCharged:Number;

        public function ichigo_bforward_154()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 16, this.frame17, 17, this.frame18, 22, this.frame23, 28, this.frame29, 30, this.frame31, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.hasHit = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(2);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.controls = this.self.getControls();
            };
        }

        internal function frame4():*
        {
            this.xframe = "charging";
        }

        internal function frame6():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame17():*
        {
            gotoAndPlay("charging");
        }

        internal function frame18():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.resetMovement();
            this.self.updateAttackStats({"air_ease":0});
        }

        internal function frame23():*
        {
            this.xframe = "attack";
            this.self.resetMovement();
            this.self.setIntangibility(true);
            this.chargeTime = (this.self.getExecTime() - 1);
            this.speedCharged = ((this.chargeTime / 2) + 21);
            this.self.setXSpeed(this.speedCharged, false);
            this.controls = this.self.getControls();
        }

        internal function frame29():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame31():*
        {
            this.self.setXSpeed(0, false);
            this.self.playAttackSound(2);
            this.self.setXSpeed(0);
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

