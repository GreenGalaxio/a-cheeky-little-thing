// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//goku_fla.ss_goku_ftilt_576

package goku_fla
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

    public dynamic class ss_goku_ftilt_576 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function ss_goku_ftilt_576()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 7, this.frame8, 10, this.frame11, 15, this.frame16);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            this.self.playAttackSound(1);
            this.self.playVoiceSound(1);
        }

        internal function frame8():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
            this.self.refreshAttackID();
        }

        internal function frame16():*
        {
            this.self.endAttack();
        }


    }
}//package goku_fla

