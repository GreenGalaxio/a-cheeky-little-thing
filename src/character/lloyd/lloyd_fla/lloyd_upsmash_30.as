// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_upsmash_30

package lloyd_fla
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

    public dynamic class lloyd_upsmash_30 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var xframe:String;

        public function lloyd_upsmash_30()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 10, this.frame11, 12, this.frame13, 13, this.frame14, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
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
            this.self.playVoiceSound(2);
        }

        internal function frame11():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame14():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":9,
                "direction":30,
                "kbConstant":85
            });
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

