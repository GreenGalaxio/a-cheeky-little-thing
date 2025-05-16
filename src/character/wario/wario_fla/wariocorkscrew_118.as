// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariocorkscrew_118

package wario_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class wariocorkscrew_118 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var yConstant:*;
        public var newStats:*;

        public function wariocorkscrew_118()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 24, this.frame25, 25, this.frame26, 26, this.frame27, 28, this.frame29, 30, this.frame31);
        }

        public function uSpecConstant():void
        {
            this.self.setYSpeed(this.yConstant);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.yConstant = -9;
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                if (this.self.isOnGround())
                {
                    this.self.setXSpeed((this.self.getXSpeed() * 0.1));
                };
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
            this.self.updateAttackStats({"allowControl":true});
            SSF2API.createTimer(this.self, 1, 0, this.uSpecConstant);
        }

        internal function frame25():*
        {
            this.self.updateAttackStats({"refreshRate":25});
            this.self.refreshAttackID();
            this.yConstant = -2;
            this.newStats = {
                "direction":86,
                "power":70,
                "damage":6,
                "kbConstant":80,
                "hitStun":1,
                "hitLag":-1
            };
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame26():*
        {
            this.yConstant++;
        }

        internal function frame27():*
        {
            this.yConstant++;
        }

        internal function frame29():*
        {
            SSF2API.destroyTimer(this.self, this.uSpecConstant);
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

