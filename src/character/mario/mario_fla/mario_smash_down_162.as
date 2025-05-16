// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_smash_down_162

package mario_fla
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

    public dynamic class mario_smash_down_162 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var itemBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function mario_smash_down_162()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 7, this.frame8, 8, this.frame9, 11, this.frame12, 12, this.frame13, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame7():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame8():*
        {
            this.xframe = "attack";
            SSF2API.playSound("brawl_swing_s");
        }

        internal function frame9():*
        {
            SSF2API.playSound("mario_Dsmash");
        }

        internal function frame12():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":10,
                "power":35,
                "kbConstant":75
            });
        }

        internal function frame13():*
        {
            SSF2API.playSound("brawl_swing_l");
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

