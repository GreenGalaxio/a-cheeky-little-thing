// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioledgeattack_147

package wario_fla
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

    public dynamic class warioledgeattack_147 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var playsound:Number;
        public var audio:Number;
        public var damage:Number;
        public var newStats:*;

        public function warioledgeattack_147()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 8, this.frame9, 9, this.frame10, 13, this.frame14, 23, this.frame24, 24, this.frame25, 25, this.frame26, 26, this.frame27, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setIntangibility(true);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
            };
        }

        internal function frame2():*
        {
            if ((((this.playsound > 0.2) && (this.playsound <= 0.4)) && (!(this.audio == 1))))
            {
                this.self.playVoiceSound(1);
                this.self.setGlobalVariable("audio", 1);
            };
            if ((((this.playsound > 0.4) && (this.playsound <= 0.6)) && (!(this.audio == 2))))
            {
                this.self.playVoiceSound(2);
                this.self.setGlobalVariable("audio", 2);
            };
            if ((((this.playsound > 0.6) && (this.playsound <= 0.8)) && (!(this.audio == 3))))
            {
                this.self.playVoiceSound(3);
                this.self.setGlobalVariable("audio", 3);
            };
            if ((((this.playsound > 0.8) && (this.playsound <= 1)) && (!(this.audio == 4))))
            {
                this.self.playVoiceSound(4);
                this.self.setGlobalVariable("audio", 4);
            };
        }

        internal function frame6():*
        {
            this.damage = 0;
            this.damage = this.self.getDamage();
            if (this.damage >= 100)
            {
                gotoAndPlay("over100");
            };
        }

        internal function frame9():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame10():*
        {
            this.self.setXSpeed(10, false);
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.setXSpeed(1, false);
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }

        internal function frame25():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame26():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame27():*
        {
            this.self.setXSpeed(12, false);
            this.newStats = {
                "direction":35,
                "damage":15
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

