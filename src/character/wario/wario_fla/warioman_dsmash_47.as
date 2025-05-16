// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//wario_fla.warioman_dsmash_47

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

    public dynamic class warioman_dsmash_47 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var newStats:*;

        public function warioman_dsmash_47()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 8, this.frame9, 9, this.frame10, 17, this.frame18, 39, this.frame40);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "null";
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            gotoAndPlay(10);
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame18():*
        {
            this.self.playAttackSound(2);
            this.newStats = {
                "direction":45,
                "power":40,
                "damage":11,
                "kbConstant":100
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }


    }
}//package wario_fla

