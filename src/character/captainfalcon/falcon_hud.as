// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//falcon_hud

package 
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class falcon_hud extends MovieClip 
    {

        public var p1:MovieClip;
        public var p2:MovieClip;
        public var p3:MovieClip;
        public var p4:MovieClip;

        public function falcon_hud()
        {
            addFrameScript(4, this.frame5, 33, this.frame34, 71, this.frame72, 87, this.frame88, 89, this.frame90, 121, this.frame122);
        }

        internal function frame5():*
        {
            SSF2API.playSound("blueFalcon");
        }

        internal function frame34():*
        {
            SSF2API.playSound("blueFalcon_pass");
        }

        internal function frame72():*
        {
            SSF2API.playSound("blueFalcon_pass");
        }

        internal function frame88():*
        {
            SSF2API.playSound("blueFalcon_leaves");
        }

        internal function frame90():*
        {
            SSF2API.playSound("blueFalcon_pass");
        }

        internal function frame122():*
        {
            stop();
            if (this.parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

