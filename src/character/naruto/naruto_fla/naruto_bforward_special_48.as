// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_bforward_special_48

package naruto_fla
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

    public dynamic class naruto_bforward_special_48 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;

        public function naruto_bforward_special_48()
        {
            addFrameScript(0, this.frame1, 20, this.frame21, 32, this.frame33, 33, this.frame34, 34, this.frame35, 53, this.frame54);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame21():*
        {
            this.self.updateAttackStats({"allowFullInterrupt":true});
        }

        internal function frame33():*
        {
            this.self.updateAttackStats({"allowFullInterrupt":false});
        }

        internal function frame34():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
            this.self.setInvincibility(true);
        }

        internal function frame35():*
        {
            this.self.fireProjectile("kyuubi_bijuudama");
        }

        internal function frame54():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

