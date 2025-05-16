// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_rollup_158

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

    public dynamic class naruto_rollup_158 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var naruto_language:*;

        public function naruto_rollup_158()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 13, this.frame14, 23, this.frame24);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setIntangibility(true);
            };
        }

        internal function frame9():*
        {
            this.naruto_language = this.self.getGlobalVariable("language_Select");
            if (this.naruto_language == "JPN")
            {
                SSF2API.playSound("naruto_ledge_getup");
            }
            else
            {
                SSF2API.playSound("ENG_naruto_jump1", true);
            };
        }

        internal function frame14():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame24():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

