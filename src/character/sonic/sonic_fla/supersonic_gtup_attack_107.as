// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_gtup_attack_107

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

    public dynamic class supersonic_gtup_attack_107 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function supersonic_gtup_attack_107()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 14, this.frame15);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playAttackSound(1);
                this.self.playVoiceSound(1);
                this.self.setIntangibility(true);
            };
        }

        internal function frame7():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame15():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

