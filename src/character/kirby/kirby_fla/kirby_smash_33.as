// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_smash_33

package kirby_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class kirby_smash_33 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hatBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var self:*;
        public var xframe:String;

        public function kirby_smash_33()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 9, this.frame10, 10, this.frame11, 14, this.frame15, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
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
            this.self.setXSpeed(11, false);
        }

        internal function frame15():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":13,
                "power":50,
                "kbConstant":96
            });
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

