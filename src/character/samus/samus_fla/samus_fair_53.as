// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_fair_53

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

    public dynamic class samus_fair_53 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;

        public function samus_fair_53()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 4, this.frame5, 5, this.frame6, 7, this.frame8, 8, this.frame9, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 20, this.frame21, 21, this.frame22, 22, this.frame23, 24, this.frame25);
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
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
            this.self.attachEffect("samusBoomEffect1");
        }

        internal function frame5():*
        {
            this.self.refreshAttackID();
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
            this.self.attachEffect("samusBoomEffect2");
        }

        internal function frame8():*
        {
            this.self.refreshAttackID();
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
            this.self.attachEffect("samusBoomEffect3");
        }

        internal function frame11():*
        {
            this.self.refreshAttackID();
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
            this.self.attachEffect("samusBoomEffect4");
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackBoxStats(1, {
                "direction":45,
                "damage":5,
                "kbConstant":85,
                "hitLag":-1,
                "reversableAngle":false
            });
            this.self.updateAttackBoxStats(2, {
                "direction":45,
                "damage":5,
                "kbConstant":85,
                "hitLag":-1,
                "reversableAngle":false
            });
            this.self.attachEffect("samusBoomEffect5");
        }

        internal function frame21():*
        {
            this.self.endAttack();
        }

        internal function frame22():*
        {
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame23():*
        {
            SSF2API.playSound("samus_landing_heavy");
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

