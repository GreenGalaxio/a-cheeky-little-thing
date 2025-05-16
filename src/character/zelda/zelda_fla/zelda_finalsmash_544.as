// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_finalsmash_544

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

    public dynamic class zelda_finalsmash_544 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function zelda_finalsmash_544()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 9, this.frame10, 39, this.frame40, 42, this.frame43);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame40():*
        {
            this.self.playAttackSound(2);
            this.self.playVoiceSound(2);
            this.self.fireProjectile("lightarrow");
        }

        internal function frame43():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

