// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_up_smash_65

package sonic_fla
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

    public dynamic class supersonic_up_smash_65 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:*;

        public function supersonic_up_smash_65()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 6, this.frame7, 21, this.frame22, 28, this.frame29);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.xframe = "charging";
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame7():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(2);
            this.self.playVoiceSound(1);
        }

        internal function frame22():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":65,
                "direction":90,
                "damage":10
            });
        }

        internal function frame29():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

