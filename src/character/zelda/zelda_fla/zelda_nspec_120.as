// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_nspec_120

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

    public dynamic class zelda_nspec_120 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox4:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function zelda_nspec_120()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 5, this.frame6, 20, this.frame21, 35, this.frame36);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame3():*
        {
            this.self.playVoiceSound(1);
            this.self.setIntangibility(true);
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame21():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":5,
                "power":45,
                "kbConstant":70,
                "direction":50,
                "effectSound":"sw_scratch"
            });
            this.self.updateAttackBoxStats(2, {
                "damage":5,
                "power":45,
                "kbConstant":70,
                "direction":50,
                "effectSound":"sw_scratch"
            });
            this.self.updateAttackBoxStats(3, {
                "damage":5,
                "power":45,
                "kbConstant":70,
                "direction":50,
                "effectSound":"sw_scratch"
            });
            this.self.updateAttackStats({"refreshRate":10});
            this.self.refreshAttackID();
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

