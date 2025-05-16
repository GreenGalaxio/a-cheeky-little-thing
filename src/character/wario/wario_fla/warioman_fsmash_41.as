// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_fsmash_41

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

    public dynamic class warioman_fsmash_41 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function warioman_fsmash_41()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 11, this.frame12, 12, this.frame13, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame9():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            gotoAndPlay(9);
        }

        internal function frame13():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

