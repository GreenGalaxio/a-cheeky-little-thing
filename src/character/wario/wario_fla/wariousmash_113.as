// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.wariousmash_113

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

    public dynamic class wariousmash_113 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;
        public var newStats:*;

        public function wariousmash_113()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 9, this.frame10, 10, this.frame11, 12, this.frame13, 14, this.frame15, 16, this.frame17, 18, this.frame19, 20, this.frame21, 22, this.frame23, 23, this.frame24, 33, this.frame34);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.xframe = null;
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame10():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame11():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
            this.newStats = {"damage":2};
            this.self.updateAttackBoxStats(1, this.newStats);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.newStats = {
                "direction":80,
                "power":70,
                "damage":6,
                "kbConstant":90,
                "hitStun":3,
                "selfHitStun":2,
                "effect_id":"effect_hit2",
                "effectSound":"brawl_punch_l"
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
        }

        internal function frame34():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

