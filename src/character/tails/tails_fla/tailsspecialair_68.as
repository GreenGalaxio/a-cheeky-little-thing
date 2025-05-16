// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsspecialair_68

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class tailsspecialair_68 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function tailsspecialair_68()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 9, this.frame10, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackStats({"allowControl":false});
            this.self.fireProjectile("tails_cannon_air");
            this.self.setXSpeed(-5, false);
            this.self.setYSpeed(-10);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package tails_fla

