// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_dsmash_30

package metaknight_fla
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

    public dynamic class metaknight_dsmash_30 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;

        public function metaknight_dsmash_30()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 12, this.frame13, 13, this.frame14, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame4():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {"damage":13});
        }

        internal function frame26():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

