// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_uair_52

package samus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class samus_uair_52 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;

        public function samus_uair_52()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 4, this.frame5, 5, this.frame6, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 14, this.frame15, 15, this.frame16, 16, this.frame17, 18, this.frame19, 20, this.frame21);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            };
        }

        internal function frame3():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":80,
                "damage":1
            });
            this.self.updateAttackBoxStats(2, {
                "direction":80,
                "damage":1
            });
            this.self.refreshAttackID();
        }

        internal function frame5():*
        {
            this.self.refreshAttackID();
        }

        internal function frame6():*
        {
            this.self.refreshAttackID();
        }

        internal function frame7():*
        {
            this.self.refreshAttackID();
        }

        internal function frame8():*
        {
            this.self.refreshAttackID();
        }

        internal function frame9():*
        {
            this.self.refreshAttackID();
        }

        internal function frame10():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":68,
                "kbConstant":80,
                "power":60,
                "selfHitStun":1,
                "hitStun":3,
                "damage":7
            });
            this.self.updateAttackBoxStats(2, {
                "direction":68,
                "kbConstant":80,
                "power":60,
                "selfHitStun":1,
                "hitStun":3,
                "damage":7
            });
            this.self.updateAttackBoxStats(3, {
                "direction":68,
                "kbConstant":80,
                "power":60,
                "selfHitStun":1,
                "hitStun":3,
                "damage":7
            });
            this.self.refreshAttackID();
        }

        internal function frame15():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }

        internal function frame17():*
        {
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame19():*
        {
            SSF2API.playSound("samus_landing_heavy");
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

