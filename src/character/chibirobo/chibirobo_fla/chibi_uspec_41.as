// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_uspec_41

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class chibi_uspec_41 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var yConstant:*;

        public function chibi_uspec_41()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 24, this.frame25, 26, this.frame27);
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
                this.self.playAttackSound(1);
            };
        }

        internal function frame8():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.uSpecConstant);
            this.self.updateAttackStats({"allowControl":true});
            this.self.playAttackSound(2);
        }

        internal function frame25():*
        {
            SSF2API.destroyTimer(this.self, this.uSpecConstant);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

