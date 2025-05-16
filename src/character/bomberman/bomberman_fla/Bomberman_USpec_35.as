// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_USpec_35

package bomberman_fla
{
    import flash.display.MovieClip;
    import flash.geom.Point;
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

    public dynamic class Bomberman_USpec_35 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var repeat:*;
        public var effectSize:*;
        public var effectSizePoint:*;
        public var jetpackLeftOffset:*;
        public var jetpackRightOffset:*;

        public function Bomberman_USpec_35()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 12, this.frame13, 14, this.frame15, 15, this.frame16, 18, this.frame19, 21, this.frame22, 24, this.frame25, 27, this.frame28, 30, this.frame31, 33, this.frame34, 39, this.frame40, 40, this.frame41);
        }

        public function jetpackDust():void
        {
            this.jetpackLeftOffset = new Point((this.self.getX() - 9), (this.self.getY() - 15));
            this.jetpackRightOffset = new Point((this.self.getX() + 9), (this.self.getY() - 15));
            if (this.repeat > 5)
            {
                this.effectSize = (this.effectSize * 0.5);
                this.effectSizePoint = new Point(this.effectSize, this.effectSize);
            };
            this.self.attachEffect("dust", {
                "x":-9,
                "y":-15
            });
            this.self.attachEffect("dust", {
                "x":9,
                "y":-15
            });
            this.repeat++;
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
            this.self.setYSpeed(-30);
            this.self.setXSpeed(0);
            this.repeat = 1;
            this.effectSize = 1;
            this.effectSizePoint = new Point(this.effectSize, this.effectSize);
            this.jetpackLeftOffset = new Point((this.self.getX() - 9), this.self.getY());
            this.jetpackRightOffset = new Point((this.self.getX() + 9), this.self.getY());
            this.self.attachEffect("jetpackExplosion", {"x":-9});
            this.self.attachEffect("jetpackExplosion", {"x":9});
            SSF2API.createTimer(this.self, 3, 7, this.jetpackDust);
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "burn":false,
                "damage":1,
                "priority":2,
                "hitStun":3,
                "hitLag":-1.2,
                "selfHitStun":1,
                "effect_id":"effect_hit1",
                "direction":90,
                "power":98,
                "kbConstant":0,
                "effectSound":"brawl_punch_s"
            });
        }

        internal function frame16():*
        {
            this.self.updateAttackStats({"allowControl":true});
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            this.self.playAttackSound(3);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            this.self.refreshAttackID();
        }

        internal function frame22():*
        {
            this.self.refreshAttackID();
        }

        internal function frame25():*
        {
            this.self.refreshAttackID();
        }

        internal function frame28():*
        {
            this.self.refreshAttackID();
        }

        internal function frame31():*
        {
            this.self.refreshAttackID();
        }

        internal function frame34():*
        {
            this.self.updateAttackBoxStats(1, {
                "hitStun":3,
                "selfHitStun":3,
                "damage":4,
                "kbConstant":80,
                "power":90,
                "direction":75,
                "effectSound":"brawl_punch_m"
            });
            this.self.refreshAttackID();
        }

        internal function frame40():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame41():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

