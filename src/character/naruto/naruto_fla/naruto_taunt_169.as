// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_taunt_169

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

    public dynamic class naruto_taunt_169 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;

        public function naruto_taunt_169()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 7, this.frame8, 28, this.frame29, 39, this.frame40, 55, this.frame56, 58, this.frame59, 71, this.frame72, 80, this.frame81, 81, this.frame82, 104, this.frame105, 130, this.frame131);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame2():*
        {
            SSF2API.playSound("naruto_taunt", true);
        }

        internal function frame8():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame29():*
        {
            SSF2API.playSound("naruto_sexy");
        }

        internal function frame40():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }

        internal function frame59():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame72():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame81():*
        {
            this.self.endAttack();
        }

        internal function frame82():*
        {
        }

        internal function frame105():*
        {
            SSF2API.playSound("naruto_taunt", true);
        }

        internal function frame131():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

