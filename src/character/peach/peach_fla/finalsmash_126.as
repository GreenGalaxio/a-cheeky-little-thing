// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.finalsmash_126

package peach_fla
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

    public dynamic class finalsmash_126 extends MovieClip 
    {

        public var self:*;

        public function finalsmash_126()
        {
            addFrameScript(0, this.frame1, 23, this.frame24, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
            };
        }

        internal function frame24():*
        {
            this.self.fireProjectile("peachBeam");
            this.self.playAttackSound(2);
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

