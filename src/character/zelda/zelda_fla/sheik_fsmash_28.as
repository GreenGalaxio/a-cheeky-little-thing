// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_fsmash_28

package zelda_fla
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

    public dynamic class sheik_fsmash_28 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var xframe:String;
        public var self:*;

        public function sheik_fsmash_28()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 13, this.frame14, 17, this.frame18, 20, this.frame21, 32, this.frame33);
        }

        internal function frame1():*
        {
            this.xframe = null;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
        }

        internal function frame8():*
        {
            gotoAndPlay("charging");
        }

        internal function frame9():*
        {
            this.xframe = "attack";
        }

        internal function frame12():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame13():*
        {
            this.self.setXSpeed(10, false);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":12,
                "kbConstant":75,
                "direction":50,
                "power":50
            });
            this.self.updateAttackBoxStats(2, {
                "damage":12,
                "kbConstant":75,
                "direction":50,
                "power":50
            });
            this.self.setXSpeed(14, false);
        }

        internal function frame21():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

