// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.kyuubi_naruto_taunt_81

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

    public dynamic class kyuubi_naruto_taunt_81 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function kyuubi_naruto_taunt_81()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 8, this.frame9, 12, this.frame13, 16, this.frame17, 19, this.frame20, 22, this.frame23, 25, this.frame26, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
                this.self.playSpecificVoice("naruto_taunt_special");
            };
        }

        internal function frame3():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame6():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame9():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame13():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame17():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame20():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame23():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame26():*
        {
            SSF2API.playSound("kyuubi_naruto_taunt_sfx1");
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

