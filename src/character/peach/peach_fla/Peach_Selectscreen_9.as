// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Selectscreen_9

package peach_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class Peach_Selectscreen_9 extends MovieClip 
    {

        public var self:*;

        public function Peach_Selectscreen_9()
        {
            addFrameScript(0, this.frame1, 25, this.frame26);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame26():*
        {
            gotoAndPlay("again");
        }


    }
}//package peach_fla

