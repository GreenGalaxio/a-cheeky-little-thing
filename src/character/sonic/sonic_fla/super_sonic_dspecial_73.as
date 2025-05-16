// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.super_sonic_dspecial_73

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

    public dynamic class super_sonic_dspecial_73 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function super_sonic_dspecial_73()
        {
            addFrameScript(0, this.frame1, 19, this.frame20, 21, this.frame22, 23, this.frame24);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.self.playVoiceSound(1);
            };
        }

        internal function frame20():*
        {
            this.self.fireProjectile("supersonic_tornado");
        }

        internal function frame22():*
        {
            this.self.setYSpeed(-4);
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

