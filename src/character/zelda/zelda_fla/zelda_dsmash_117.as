// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_dsmash_117

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

    public dynamic class zelda_dsmash_117 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var xframe:String;

        public function zelda_dsmash_117()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 7, this.frame8, 13, this.frame14, 14, this.frame15, 21, this.frame22);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame7():*
        {
            gotoAndPlay("charging");
        }

        internal function frame8():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame14():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {"damage":11});
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

