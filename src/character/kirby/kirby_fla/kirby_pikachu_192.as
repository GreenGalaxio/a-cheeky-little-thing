// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//kirby_fla.kirby_pikachu_192

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

    public dynamic class kirby_pikachu_192 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function kirby_pikachu_192()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 8, this.frame9, 24, this.frame25);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame8():*
        {
            this.self.fireProjectile("thunderJolt");
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package kirby_fla

