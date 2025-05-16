// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_USmash_26

package bomberman_fla
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

    public dynamic class Bomberman_USmash_26 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var xframe:String;
        public var self:*;

        public function Bomberman_USmash_26()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 9, this.frame10, 16, this.frame17, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.xframe = null;
            this.self = SSF2API.getCharacter(this);
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
        }

        internal function frame17():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":13,
                "power":70,
                "direction":88,
                "kbConstant":75,
                "hitLag":-1,
                "burn":true,
                "effect_id":"effect_firehit1"
            });
            this.self.updateAttackBoxStats(2, {
                "damage":13,
                "power":70,
                "direction":88,
                "kbConstant":75,
                "hitLag":-1,
                "burn":true,
                "effect_id":"effect_firehit1"
            });
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
            SSF2API.shakeCamera(6);
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

