// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//captainfalcon_fla.falcon_usmash_32

package captainfalcon_fla
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

    public dynamic class falcon_usmash_32 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var xframe:String;
        public var self:*;

        public function falcon_usmash_32()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 11, this.frame12, 14, this.frame15, 16, this.frame17, 18, this.frame19, 22, this.frame23, 23, this.frame24, 27, this.frame28, 38, this.frame39);
        }

        internal function frame1():*
        {
            this.xframe = null;
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame6():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            gotoAndPlay("charging");
        }

        internal function frame12():*
        {
            this.xframe = "attack";
        }

        internal function frame15():*
        {
        }

        internal function frame17():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame19():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.updateAttackBoxStats(2, {
                "damage":13,
                "power":30,
                "kbConstant":128,
                "effectSound":"brawl_kick_l",
                "hitStun":2,
                "selfHitStun":1,
                "direction":70
            });
            this.self.updateAttackBoxStats(1, {
                "damage":12,
                "power":30,
                "kbConstant":110,
                "effectSound":"brawl_kick_l",
                "hitStun":2,
                "selfHitStun":1,
                "direction":70
            });
            this.self.refreshAttackID();
        }

        internal function frame24():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame39():*
        {
            this.self.endAttack();
        }


    }
}//package captainfalcon_fla

