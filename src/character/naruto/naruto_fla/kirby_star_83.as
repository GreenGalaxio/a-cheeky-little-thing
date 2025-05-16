// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.kirby_star_83

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class kirby_star_83 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;

        public function kirby_star_83()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }


    }
}//package naruto_fla

