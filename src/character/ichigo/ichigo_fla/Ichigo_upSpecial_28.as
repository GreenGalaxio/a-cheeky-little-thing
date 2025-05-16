// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.Ichigo_upSpecial_28

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class Ichigo_upSpecial_28 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var head:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var hasHit:Boolean;

        public function Ichigo_upSpecial_28()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 4, this.frame5, 29, this.frame30, 30, this.frame31, 52, this.frame53, 61, this.frame62);
        }

        public function jumpToAfterHit(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
            SSF2API.destroyTimer(this.self, this.momentum);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("afterHit");
        }

        public function momentum():*
        {
            this.self.setYSpeed(-12);
            this.self.setXSpeed(12, false);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.hasHit = false;
        }

        internal function frame2():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT, this.jumpToAfterHit);
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame5():*
        {
            SSF2API.createTimer(this.self, 1, 10, this.momentum);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame31():*
        {
            this.hasHit = true;
            this.self.refreshAttackID();
            this.self.updateAttackStats({
                "air_ease":0,
                "refreshRate":2,
                "allowControl":false
            });
            this.self.updateAttackBoxStats(1, {
                "power":50,
                "damage":2,
                "hitStun":5,
                "kbConstant":115
            });
            this.self.resetMovement();
        }

        internal function frame53():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":-6,
                "power":45,
                "damage":7,
                "hitStun":2,
                "kbConstant":65
            });
            this.self.updateAttackStats({"refreshRate":50});
        }

        internal function frame62():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

