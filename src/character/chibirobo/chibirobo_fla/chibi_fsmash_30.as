// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.chibi_fsmash_30

package chibirobo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class chibi_fsmash_30 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:*;

        public function chibi_fsmash_30()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 11, this.frame12, 13, this.frame14, 16, this.frame17, 18, this.frame19, 20, this.frame21, 21, this.frame22, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if (((SSF2API.isReady()) && (this.self)))
            {
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
        }

        internal function frame12():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame17():*
        {
            this.self.updateAttackBoxStats(1, {"power":10});
        }

        internal function frame19():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "reversableAngle":true,
                "power":60,
                "kbConstant":90,
                "direction":50
            });
            this.self.refreshAttackID();
        }

        internal function frame21():*
        {
            this.self.refreshAttackID();
        }

        internal function frame22():*
        {
            this.self.refreshAttackID();
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package chibirobo_fla

