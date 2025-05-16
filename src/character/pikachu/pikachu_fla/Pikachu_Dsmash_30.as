// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.Pikachu_Dsmash_30

package pikachu_fla
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

    public dynamic class Pikachu_Dsmash_30 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function Pikachu_Dsmash_30()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3, 3, this.frame4, 4, this.frame5, 14, this.frame15, 26, this.frame27, 28, this.frame29);
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

        internal function frame3():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame4():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame15():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "kbConstant":190,
                "selfHitStun":1,
                "hitStun":3,
                "damage":3,
                "direction":42
            });
        }

        internal function frame27():*
        {
            this.self.updateAttackStats({
                "allowFullInterrupt":true,
                "allowJump":true,
                "cancel":true
            });
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package pikachu_fla

