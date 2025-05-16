// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_dspec_507

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

    public dynamic class zelda_dspec_507 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function zelda_dspec_507()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 12, this.frame13, 36, this.frame37, 37, this.frame38, 47, this.frame48);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame11():*
        {
            this.self.setIntangibility(true);
            this.self.playAttackSound(2);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame37():*
        {
            this.self.replaceCharacter("sheik", "b_down", "toSheik");
        }

        internal function frame38():*
        {
            this.self.setIntangibility(false);
            this.self.playAttackSound(4);
        }

        internal function frame48():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

