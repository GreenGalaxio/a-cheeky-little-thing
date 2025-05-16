// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_fair_41

package metaknight_fla
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

    public dynamic class metaknight_fair_41 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function metaknight_fair_41()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 7, this.frame8, 8, this.frame9, 17, this.frame18);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame3():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame4():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":90,
                "power":0,
                "damage":2,
                "hitLag":9
            });
            this.self.updateAttackBoxStats(2, {
                "direction":90,
                "power":0,
                "damage":2,
                "hitLag":9
            });
            this.self.refreshAttackID();
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":50,
                "power":35,
                "kbConstant":105,
                "damage":6,
                "selfHitStun":1,
                "hitLag":-1.2,
                "reversableAngle":false
            });
            this.self.updateAttackBoxStats(2, {
                "direction":50,
                "power":35,
                "kbConstant":105,
                "damage":6,
                "selfHitStun":1,
                "hitLag":-1.2,
                "reversableAngle":false
            });
            this.self.updateAttackBoxStats(3, {
                "direction":50,
                "power":35,
                "kbConstant":105,
                "damage":6,
                "selfHitStun":1,
                "hitLag":-1.2,
                "reversableAngle":false
            });
            this.self.refreshAttackID();
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

