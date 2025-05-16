// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_nspecial_142

package ichigo_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_nspecial_142 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function ichigo_nspecial_142()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 12, this.frame13, 20, this.frame21, 21, this.frame22, 36, this.frame37);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame6():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame21():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(1);
            this.self.setAttackEnabled(false, "b");
            this.self.setAttackEnabled(false, "b_air");
        }

        internal function frame22():*
        {
            this.self.fireProjectile("getsuga2");
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

