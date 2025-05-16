// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_taunt_217

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

    public dynamic class ichigo_taunt_217 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var self:*;

        public function ichigo_taunt_217()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 45, this.frame46, 48, this.frame49, 58, this.frame59, 94, this.frame95, 103, this.frame104, 122, this.frame123, 135, this.frame136, 148, this.frame149);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame9():*
        {
            SSF2API.playSound("ichigo_taunt");
        }

        internal function frame46():*
        {
            this.self.endAttack();
        }

        internal function frame49():*
        {
            SSF2API.playSound("Keyblade_Shing");
        }

        internal function frame59():*
        {
            SSF2API.playSound("Taunt_dudes");
        }

        internal function frame95():*
        {
            this.self.endAttack();
        }

        internal function frame104():*
        {
            SSF2API.playSound("Ichigo_Attack1");
        }

        internal function frame123():*
        {
            SSF2API.playSound("handgesture");
        }

        internal function frame136():*
        {
            SSF2API.playSound("Ichigo_Taunt2");
        }

        internal function frame149():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

