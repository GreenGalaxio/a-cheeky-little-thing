// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_zelda_210

package kirby_fla
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

    public dynamic class kirby_zelda_210 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var attackBox4:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function kirby_zelda_210()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 5, this.frame6, 17, this.frame18, 35, this.frame36);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
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

        internal function frame18():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":45,
                "direction":50
            });
            this.self.updateAttackBoxStats(2, {
                "power":45,
                "direction":50
            });
            this.self.updateAttackBoxStats(3, {
                "power":45,
                "direction":50
            });
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

