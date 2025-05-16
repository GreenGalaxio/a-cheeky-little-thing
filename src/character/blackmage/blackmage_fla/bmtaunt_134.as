// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmtaunt_134

package blackmage_fla
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

    public dynamic class bmtaunt_134 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function bmtaunt_134()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 44, this.frame45, 70, this.frame71, 84, this.frame85, 104, this.frame105, 116, this.frame117, 183, this.frame184);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
        }

        internal function frame5():*
        {
            SSF2API.playSound("bmtaunt3");
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame71():*
        {
            SSF2API.playSound("bm_taunt2");
        }

        internal function frame85():*
        {
            SSF2API.playSound("bm_taunt2");
        }

        internal function frame105():*
        {
            this.self.endAttack();
        }

        internal function frame117():*
        {
            SSF2API.playSound("bm_taunt3");
        }

        internal function frame184():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

