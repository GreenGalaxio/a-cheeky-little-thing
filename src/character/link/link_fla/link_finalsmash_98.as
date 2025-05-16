// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_finalsmash_98

package link_fla
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

    public dynamic class link_finalsmash_98 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var opponentX:*;
        public var opponentY:*;
        public var opponent:*;
        public var startedMoving:*;
        public var failTimer:*;
        public var continuePlaying:Boolean;

        public function link_finalsmash_98()
        {
            addFrameScript(0, this.frame1, 11, this.frame12, 16, this.frame17, 17, this.frame18, 18, this.frame19, 19, this.frame20, 20, this.frame21, 22, this.frame23, 26, this.frame27, 34, this.frame35, 40, this.frame41, 48, this.frame49, 50, this.frame51, 58, this.frame59, 68, this.frame69, 74, this.frame75, 84, this.frame85, 90, this.frame91, 96, this.frame97, 104, this.frame105, 111, this.frame112, 120, this.frame121, 122, this.frame123, 147, this.frame148, 149, this.frame150, 167, this.frame168);
        }

        public function keepGoing(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.keepGoing);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.keepGoing);
            this.continuePlaying = true;
            this.opponent = _arg_1.data.receiver;
            this.opponentX = _arg_1.data.receiver.getX();
            this.opponentY = _arg_1.data.receiver.getY();
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.opponentX = null;
            this.opponentY = null;
            this.opponent = null;
            this.startedMoving = false;
            this.failTimer = 0;
            this.continuePlaying = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.keepGoing);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.keepGoing);
            };
        }

        internal function frame12():*
        {
            if (this.continuePlaying)
            {
                this.gotoAndPlay("move");
            };
        }

        internal function frame17():*
        {
            this.self.endAttack();
        }

        internal function frame18():*
        {
            this.opponentX = this.opponent.getX();
            this.opponentY = this.opponent.getY();
            this.self.setXSpeed(((this.opponentX - this.self.getX()) / 5), true);
            this.self.setYSpeed(((this.opponentY - this.self.getY()) / 5));
            this.failTimer++;
            if (this.failTimer >= 6)
            {
                this.opponent.grabRelease();
                this.self.endAttack();
                this.self.grabRelease();
            };
            if ((((this.startedMoving) && (this.opponentX <= (this.self.getX() + 50))) && (this.opponentX >= (this.self.getX() - 50))))
            {
                this.gotoAndPlay("attack");
            };
            this.startedMoving = true;
        }

        internal function frame19():*
        {
            this.opponentX = this.opponent.getX();
            this.opponentY = this.opponent.getY();
            this.self.setXSpeed(((this.opponentX - this.self.getX()) / 5), true);
            this.self.setYSpeed(((this.opponentY - this.self.getY()) / 5));
            if ((((this.startedMoving) && (this.opponentX <= (this.self.getX() + 50))) && (this.opponentX >= (this.self.getX() - 50))))
            {
                this.gotoAndPlay("attack");
            };
        }

        internal function frame20():*
        {
            this.gotoAndPlay("move");
        }

        internal function frame21():*
        {
            this.self.setXSpeed(0);
        }

        internal function frame23():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "priority":7,
                "hitStun":1,
                "selfHitStun":0,
                "hitLag":-1,
                "direction":45,
                "power":0,
                "kbConstant":0,
                "effect_id":"effect_lightHit",
                "effectSound":"sw_brawl_hit_H"
            });
            this.self.updateAttackBoxStats(1, {"hasEffect":false});
        }

        internal function frame27():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame35():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame41():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame49():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame51():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame59():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame69():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame75():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame85():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame91():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame97():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame105():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame112():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame121():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
        }

        internal function frame123():*
        {
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
            this.self.playVoiceSound(2);
        }

        internal function frame148():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":35,
                "direction":40,
                "kbConstant":100,
                "damage":23,
                "hasEffect":true,
                "hitStun":8
            });
            this.self.playAttackSound(2);
            this.self.playVoiceSound(3);
            this.self.refreshAttackID();
        }

        internal function frame150():*
        {
            this.self.releaseOpponent();
        }

        internal function frame168():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

